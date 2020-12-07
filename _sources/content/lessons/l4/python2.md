# Python-based standardised processing

## Python scripts

## YAML configuration file


### Project-level parameters:

```
load_project_path: # may remain empty
photo_path: # path to photo directory
output_path: # path to output directory, usually {photo_path}/metashape
project_path: # path to Agisoft Metashape project directory, usually {photo_path}/metashape
run_name: # name of the project run (e.g., KonusdalenWestFault)
project_crs: "EPSG::32633" # 32633 is WGS1984 UTM 33N; epsg number that corresponds to the required project crs. Look here: https://epsg.io/
subdivide_task: True # Fine-level task subdivision reduces memory by breaking processing into independent chunks that are run in series. True recommended.
```

#### Networking:
```
networkProcessing:
    enabled: False
    server_ip: svalbox # Host Server IP address
```

### Marker detection
```
detectGCPs:
    enabled: False
    aruco_dict: aruco.DICT_6X6_250 # options include: aruco.DICT_6X6_250, aruco.DICT_4X4_50
    corner: "topright" # options: bottomleft (=1), topleft (2), topright (3), bottomright (4), centre (0).
    template:
        enabled: False # Keep false when using geopackage with long/lat data
        template_file_path: "../markers/markers_circle.png"
        template_size: 0.20 # one-sided dimension of a mxm square in metres. The example in Markers is a 20x20 cm frame, i.e. 0.20 m here.
```

### Processing parameters
Steps can be run or skipped using the 'enabled' parameter. If enabled == False, everything else in the step is irrelevant.
Alternatively, the entire parameter can be left out.
Keep in mind, though, that some steps require others to be completed.
E.g., not adding photos is likely to prevent photo alignment in some cases. ;)

The metashape functions powering each of these steps are listed in the comments in parentheses.
Refer to Metashape documentation for full parameter definitions: https://www.agisoft.com/pdf/metashape_python_api_1_6_0.pdf.
Parameter names here should fully follow the parameter names of the Metashape functions.
In case default parameters are to be used, comment out the corresponding parameter with an # (Exception: addGCP parameters!)

#### Add photos

```
addPhotos:
    enabled: False
    remove_photo_location_metadata: True #
    multispectral: False # Is this a multispectral photo set? If RGB, set to False.
```

#### Add masks

```
masks:
    enabled: False # Default, only enable if you have images with masks :)
    mask_path: E:\Anna\EK11\100MEDIA # Has to point to dir with masks
    mask_source: Metashape.MaskSourceFile # Default, other options include: [MaskSourceAlpha, MaskSourceFile, MaskSourceBackground, MaskSourceModel]
```

#### Add GCPs

To use GCPs, a 'gcps' folder must exist in the top level photos folder. The contents of the 'gcps' folder are created by the prep_gcps.R script. See readme: https://github.com/ucdavis/metashape
```
addGCPs:
    enabled: False
    gcp_crs: "EPSG::4326" # CRS EPSG code of GCP coordinates. 32633 (UTM 33 N) is the CRS of the sample RGB photoset.
    marker_location_accuracy: 0.1 # Recommended: 0.1. Accuracy of GCPs real-world coordinates, in meters.
    marker_projection_accuracy: 8 # Recommended: 8. Accuracy of the identified locations of the GCPs within the images, in pixels.
    optimize_w_gcps_only: True # Optimize alignment using GCPs only: required for GCP locations to take precedence over photo GPS data. Disabling it makes GCPs essentially irrelevant.
```

#### Align photos

```
alignPhotos: # (Metashape: alignPhotos)
    enabled: False
    downscale: 0 # Recommended: 1. How much to coarsen the photos when searching for tie points. Corresponding settings in Metashape: 0: Highest, 1: High, 2: Medium, 3: Low, 4: Lowest
    adaptive_fitting: True # Recommended: True. Should the camera lens model be fit at the same time as aligning photos?
    mask_tiepoints: True
    double_alignment: True
```

#### Optimise photos

```
optimizeCameras: # (Metashape: optimizeCameras) # Remove # to activate :)
    enabled: False
    adaptive_fitting: True # Recommended: True. Should the camera lens model be fit at the same time as optinizing photos?
    tiepoint_covariance: True
```

#### Build dense cloud

```
buildDenseCloud: # (Metashape: buildDepthMaps, buildDenseCloud, classifyGroundPoints, and exportPoints)
    enabled: False
    ## For depth maps (buldDepthMaps)
    downscale: 2 # Recommended: 4. How much to coarsen the photos when searching for matches to build the dense cloud. Corresponding settings in Metashape: 0: Highest, 1: High, 2: Medium, 3: Low, 4: Lowest
    filter_mode: Metashape.MildFiltering # Recommended: Metashape.MildFiltering. How to filter the point cloud. Options are NoFiltering, MildFiltering, ModerateFiltering, AggressiveFiltering. Aggressive filtering removes detail and makes worse DEMs (at least for forest). NoFiltering takes very long. In trials, it never completed.
    reuse_depth: False # Recommended: False. Purpose unknown.
    ## For dense cloud (buildDenseCloud)
    keep_depth: False # Recommended: False. Purpose unknown.
    ## For both
    max_neighbors: 100 # Recommended: 100. Maximum number of neighboring photos to use for estimating point cloud. Higher numbers may increase accuracy but dramatically increase processing time.
    ## For ground point classification (classifyGroundPoints). Definitions here: https://www.agisoft.com/forum/index.php?topic=9328.0
    classify: False # Must be enabled if a digital terrain model (DTM) is needed either for orthomosaic or DTM export
    max_angle: 15.0 # Recommended: 15.0
    max_distance: 1.0 # Recommended: 1.0
    cell_size: 50.0 # Recommended: 50.0
    ## For dense cloud export (exportPoints)
    export: False # Whether to export dense cloud file.
    format: Metashape.PointsFormatLAS # Recommended: PointsFormatLAS. The file format to export points in.
    classes: "ALL" # Recommended: "ALL". Point classes to export. Must be a list. Or can set to "ALL" to use all points. An example of a specific class is: Metashape.PointClass.Ground
```

#### Filter dense cloud

```
filterDenseCloud:
    enabled: False
    point_confidence_max: 20 # maximum point confidence for points to be removed, ranges from 1-99
```

#### Build mesh

```
buildMesh: # (Metashape: buildModel)
    enabled: False
    ## For depth maps (buldModel)
    surface_type: Metashape.Arbitrary # Recommended: Metashape.Arbitrary
    face_count: Metashape.HighFaceCount # Options are [LowFaceCount, MediumFaceCount, HighFaceCount, CustomFaceCount]
    face_count_custom: 100000 # Integer, has to be enabled through CustomFaceCount above.
    ## For dense cloud (buildDenseCloud)
    source_data: Metashape.DenseCloudData # Recommended: DenseCloudData. Others include: PointCloudData and ModelData.
    volumetric_masks: False # Default False; True for volumetric masking during 3D mesh generation, as documented here https://www.agisoft.com/index.php?id=48
```

#### Build textures

```
buildTexture: # (Metashape: buildTexture)
    enabled: False
    ## For depth maps (buldModel)
    mapping_mode: Metashape.GenericMapping # [LegacyMapping, GenericMapping, OrthophotoMapping, AdaptiveOrthophotoMapping, SphericalMapping, CameraMapping]
    blending_mode: Metashape.MosaicBlending # Recommended: Mosaic. Other options: [AverageBlending, MosaicBlending, MinBlending, MaxBlending, DisabledBlending]
    texture_size: 16384 # integer, multiple of 4096
```

#### Build tiled model

```
buildTiledModel: # (Metashape: buildTexture)
    enabled: True
    ## For depth maps (buldModel)
    source_data: Metashape.DenseCloudData
    pixel_size: 0.010
    tile_size: 256
    face_count: 4000
```
