---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.12
    jupytext_version: 1.7.1
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Python-based standardised processing

The following page provices an overview of the functions that are implemented in [Automated Metashape](https://github.com/PeterBetlem/image_processing).
These require the Python to be installed as documented in [the software section](../about/software#Python "python").

```{admonition} Version
The tutorial below assumes the latest version of Automated Metashape is used.
Minimal differences may exist between versions, especially when ensuring compatibility with Minor updates of the Agisoft Metashape releases.
```

````{admonition} Cite me
:class: seealso

Please cite the following acknowledgement when using the automated metashape scripting package:
```
Betlem, P., Birchall, T., Mosociova, T., Sartell, A.M.R., and Senger, K., 2020, From seismic-scale outcrop to hand sample: streamlining SfM photogrammetry processing in the geosciences, ARCEx, https://arcex.no/arcex-2020/.
```
````


## Automated processing with Jupyter lab

We here showcase the Automated Metashape scripts through use of Jupyter lab.
When ready, open Anaconda Prompt again, change into the *automated_metashape* environment, and run *Jupyter lab*.

```markdown
conda activate automated_metashape
jupyter lab
```

This should open up your webbrowser, and opens up the Jupyter lab interface that is used for processing.

```{warning}
Do not close the Anaconda Prompt that is running in the background.
This would instantly stop Python, and prevent processing of the models.
```

The interface features a filesystem viewer on the left, a menu bar in the top, and the main interface (with tabs) makes up the remainder of the screen.

First, make sure to browse to the file directory where you would like to store your documents.
When ready, create a *Python 3 Notebook* from the *Launcher tab*.
Save it in the following manner, creating directories where needed:

```
project_directory (The folder with all files related to this project)
├───────Notebook_directory (where you unzipped the files to)
|           Automated_metashape_notebook.ipynb (the Python 3 Notebook you just created)
└───────config (remains empty for now)
```

Here we can copy/paste the below (into individual cells);
then proceed by running each cell by either clicking the *play* button or shift-enter whilst having click on the cell.

```{code-cell} ipython3
:tags: [raises-exception]

from automated_metashape.MetashapeProcessing import AutomatedProcessing as AP
```

```{code-cell} ipython3
:tags: [raises-exception]

config_file = "../config/empty_photogrammetry_processing_settings.yml"
project = AP()
project.read_config(config_file)
project.init_workspace()
project.init_tasks()
```

If all went well, the AutomatedProcessing module was successfully imported (= no error on first input).
However, as per above, we have a *FileNotFoundError* - after all, we have yet to set up the configuration file that was linked to.

### Minimal YAML configuration file

The automated processing scripts rely on a [YAML](https://yaml.org/) configuration file.
YAML (or *YAML Ain't Markup Language*) is a human friendly data serialization standard for programming languages.

Proceed by creating a new file in the *config* directory created previously and give it the *.yml* extension.
Name this file according to the project you are working on.

At the very least, copy-paste in the project-level parameters found below.
These should be present in every YAML configuration file, regardless of the desired outcome.

```yaml
run_name: # name of the project run (e.g., KonusdalenWestFault)
load_project_path: # This field may remain empty; put the absolute filepath to a pre-existing Agisoft Metashape project here if it is to be loaded.
project_path: # path to Agisoft Metashape project directory, usually {photo_path}/metashape
project_crs: "EPSG::32633" # 32633 is WGS1984 UTM 33N; epsg number that corresponds to the required project crs. Look here: https://epsg.io/ "EPSG::40400" for hand samples.
subdivide_task: True # Fine-level task subdivision reduces memory by breaking processing into independent chunks that are run in series. True recommended.
enable_overwrite: False # If set to True, overwrites project that is loaded with load_project_path parameter. Use with caution!
```

The above won't do much - it simply creates a new Metashape project or loads an existing project and saves it again.

```{admonition} Use the standardised folder structure
:class: tip

As the script automatically searches for all compatible images within the photo_path, make sure to use the standardised folder structure described in the [Metashape tutorial](../l1/tutorial "tutorial").
```

```{admonition} Correctly filling out YAML configuration
:class: warning

Make sure...
- keep at least one space between the : (colon) and parameter
    - bad: load_project_path:asdasfasd #comment here
- keep at least one space between the parameter and # (comment)
    - bad: load_project_path: asdasfasd#comment here
- not to use any new lines in the configuration files
    - bad: load_project_path: asda ...
    - ... sfasd#comment here
```

#### Additional parameters

Steps can be run or skipped using the 'enabled' parameter. If enabled == False, everything else in the step is irrelevant.
Alternatively, the entire parameter can be left out.
Keep in mind, though, that some steps require others to be completed.
E.g., not adding photos is likely to prevent photo alignment in some cases. ;)

The metashape functions powering each of these steps are listed in the comments in parentheses.
Refer to [Metashape documentation](https://www.agisoft.com/pdf/metashape_python_api_1_6_0.pdf) for full parameter definitions.
The parameter-section names should fully follow the parameter names of the Metashape functions.
In case default parameters are to be used, remove the corresponding parameter-section.

````{tabbed} Add photos
```yaml
addPhotos:
    enabled: True
    photo_path: # path to photo directory ("data_directory" in the standardised folder directory)  - this parameter will be moved to the addPhotos configuration section in later releases.
    remove_photo_location_metadata: False # Removes photo location metadata
    multispectral: False # Is this a multispectral photo set? If RGB, set to False.
```

```{admonition} remove_photo_location_metadata
The *remove_photo_location_metadata* parameter removes all location data from the photos that are added to the project.
This should generally only be set to *True* when ground control points (GCPs) are to be used.
```
````

````{tabbed} Analyze photos
```yaml
analyzePhotos:
    enabled: True
    quality_cutoff: 0.5 # value between 0 and 1, indicates the lowest quality unit at which photos are used for processing. 0.5 is suggested by Agisoft.
```
````

````{tabbed} Add masks
```yaml
masks:
    enabled: False # Default, only enable if you have images with masks :)
    path: E:\Anna\EK11\100MEDIA\{filename}_mask.JPG # Has to point to dir with masks
    masking_mode: Metashape.MaskingModeFile # Default, other options include: Masking mode in Metashape.[MaskingModeAlpha, MaskingModeFile, MaskingModeBackground, MaskingModeModel]
```
````

````{tabbed} Alignment
```yaml
alignPhotos: # (Metashape: alignPhotos)
    enabled: True
    downscale: 0 # Recommended: 0. How much to coarsen the photos when searching for tie points. Corresponding settings in Metashape: 0: Highest, 1: High, 2: Medium, 3: Low, 4: Lowest
    adaptive_fitting: True # Recommended: True. Should the camera lens model be fit at the same time as aligning photos?
    filter_mask_tiepoints: True
    double_alignment: True
```

```{admonition} downscale
Corresponding settings in Metashape: 0: Highest, 1: High, 2: Medium, 3: Low, 4: Lowest
```

```{admonition} double_alignment
Whether or not to try alignment of images that failed alignment during the first stage.
```

````

````{tabbed} Optimise cameras
```yaml
optimizeCameras: # (Metashape: optimizeCameras)
    enabled: True
    adaptive_fitting: True # Recommended: True. Should the camera lens model be fit at the same time as optimizing photos?
    tiepoint_covariance: True
```
````

````{tabbed} Depth maps
```yaml
buildDepthMaps: # (Metashape: buildDepthMaps)
    enabled: True
    downscale: 2 # Recommended: 2. How much to coarsen the photos when searching for matches to build the dense cloud. Corresponding settings in Metashape: 1: Highest, 2: High, 3: Medium, 4: Low, 5: Lowest
    filter_mode: Metashape.MildFiltering # Recommended: Metashape.MildFiltering. How to filter the point cloud. Options are NoFiltering, MildFiltering, ModerateFiltering, AggressiveFiltering. Aggressive filtering removes detail and makes worse DEMs (at least for forest). NoFiltering takes very long. In trials, it never completed.
    reuse_depth: True # Recommended: True.
    max_neighbors: 100 # Recommended: 100. Maximum number of neighboring photos to use for estimating point cloud. Higher numbers may increase accuracy but dramatically increase processing time.

```

```{admonition} downscale
Corresponding settings in Metashape: 1: Highest, 2: High, 3: Medium, 4: Low, 5: Lowest

**Note the different internal values for the settings compared to the Aligment parameter with identical name!**
```

```{admonition} filter_mode
Options are NoFiltering, MildFiltering, ModerateFiltering, AggressiveFiltering.
Aggressive filtering removes detail and makes worse DEMs (at least for forest).
NoFiltering takes very long. In trials, it never completed.
```
````

````{tabbed} Dense cloud
```yaml
buildDenseCloud: # (Metashape: buildDepthMaps, buildDenseCloud, classifyGroundPoints, and exportPoints)
    enabled: True
    point_colors: True # enable point colors calculations
    point_confidence: True # enable point confidence calculations
    keep_depth: True # Recommended: True. Enable store depth maps option.
    max_neighbors: 100 # Recommended: 100. Maximum number of neighboring photos to use for estimating point cloud. Higher numbers may increase accuracy but dramatically increase processing time.
```
````

````{tabbed} Filter dense cloud
```yaml
filterDenseCloud:
    enabled: True
    point_confidence_max: 20 # maximum point confidence for points to be removed, ranges from 1-99
```
````


````{tabbed} Mesh
```yaml
buildMesh: # (Metashape: buildModel)
    enabled: True
    surface_type: Metashape.Arbitrary # Recommended: Metashape.Arbitrary. Surface type in [Arbitrary, HeightField]
    interpolation: Metashape.EnabledInterpolation # Interpolation mode in Metashape.[DisabledInterpolation, EnabledInterpolation, Extrapolated]
    face_count: Metashape.HighFaceCount # Options are [LowFaceCount, MediumFaceCount, HighFaceCount, CustomFaceCount]
    face_count_custom: 100000 # Integer, has to be enabled through CustomFaceCount above.
    ## For dense cloud (buildDenseCloud)
    source_data: Metashape.DenseCloudData # Recommended: DenseCloudData. Others include: Data source in [PointCloudData, DenseCloudData, DepthMapsData, ModelData, TiledModelData, ElevationData, OrthomosaicData, ImagesData]
    volumetric_masks: False # Default False; True for volumetric masking during 3D mesh generation, as documented here https://www.agisoft.com/index.php?id=48
```
````

````{tabbed} Textures
```yaml
buildTexture: # (Metashape: buildTexture)
    enabled: True
    mapping_mode: Metashape.GenericMapping # [LegacyMapping, GenericMapping, OrthophotoMapping, AdaptiveOrthophotoMapping, SphericalMapping, CameraMapping]
    blending_mode: Metashape.MosaicBlending # Recommended: Mosaic. Other options: [AverageBlending, MosaicBlending, MinBlending, MaxBlending, DisabledBlending]
    texture_size: 8192 # integer, multiple of 4096
    page_count: 5 # number of textures to create
```
````

````{tabbed} Tiled model
```yaml
buildTiledModel: # (Metashape: buildTexture)
    enabled: True
    ## For depth maps (buldModel)
    source_data: Metashape.DenseCloudData
    pixel_size: 0.010
    tile_size: 128
    face_count: 4000
```
````

````{tabbed} DEM
```yaml
buildDEM: # (Metashape: buildTexture)
    enabled: True
    source_data: Metashape.ModelData # Data source in Metashape.[PointCloudData, DenseCloudData, DepthMapsData, ModelData, TiledModelData, ElevationData, OrthomosaicData, ImagesData]
    resolution: 0.01
    interpolation: Metashape.DisabledInterpolation # Interpolation mode in Metashape.[DisabledInterpolation, EnabledInterpolation, Extrapolated]
```
````

````{tabbed} GCPs - detection
```yaml
detectGCPs:
    enabled: True
    photo_path: # path to photo directory ("data_directory" in the standardised folder directory)  - this parameter will be moved to the addPhotos configuration section in later releases.
    aruco_dict: aruco.DICT_6X6_250 # options include: aruco.DICT_6X6_250, aruco.DICT_4X4_50
    corner: "topright" # options: bottomleft (=1), topleft (2), topright (3), bottomright (4), centre (0).
    template:
        enabled: False # Keep false when using geopackage with long/lat data
        template_file_path: "../markers/markers_circle.png"
        template_size: 0.20 # one-sided dimension of a mxm square in metres. The example in Markers is a 20x20 cm frame, i.e. 0.20 m here.
```
````

````{tabbed} GCPs - add to project
```yaml
addGCPs:
    enabled: True
    gcp_crs: "EPSG::4326" # CRS EPSG code of GCP coordinates. 32633 (UTM 33 N) is the CRS of the sample RGB photoset. 4326 (GPS) is the standard for GPS coordinates.
    marker_location_accuracy: 0.1 # Recommended: 0.1. Accuracy of GCPs real-world coordinates, in meters.
    marker_projection_accuracy: 8 # Recommended: 8. Accuracy of the identified locations of the GCPs within the images, in pixels.
    optimize_w_gcps_only: True # Optimize alignment using GCPs only: required for GCP locations to take precedence over photo GPS data. Disabling it makes GCPs essentially irrelevant.
```
````

````{tabbed} Publish
```yaml
publishData:
    enabled: True
    service:  # Service type in [ServiceSketchfab, ServiceMapbox, Service4DMapper, ServiceSputnik, ServicePointscene, ServiceMelown, ServicePointbox, ServicePicterra]
    source: # Data source in [PointCloudData, DenseCloudData, DepthMapsData, ModelData, TiledModelData, ElevationData, OrthomosaicData, ImagesData]
    with_camera_track:  # True/False If model should be uploaded with camera track. Can be used only with DataSource.ModelData.
    export_point_colors:  # True/False If Point Cloud should be uploaded with point colors.
    title:  # Title of uploading model.
    description:  # Description of uploading model.
    token:  # Token used to upload data.
    is_draft:  # If model should be uploaded as draft.
    is_private:  # True/False If model should have private access.
    password:  # Password to access model if uploaded as private.
```
````

````{tabbed} Networking
```yaml
networkProcessing:
    enabled: True
    server_ip: svalbox # Host Server IP address
```
````

### Another shot

After copying over the desired parameter-sections, update the config_file path correspondingly and run the cell again.
It should now result in a successful runtime.

```{code-cell} ipython3
:tags: [raises-exception]

config_file = "../config/photogrammetry_processing_settings.yml"
project = AP()
project.read_config(config_file)
project.init_workspace()
project.init_tasks()
```

This assumes *..//config/photogrammetry_processing_settings.yml* consist of the following:

```yaml
run_name: # name of the project run (e.g., KonusdalenWestFault)
load_project_path: # This field may remain empty; put the absolute filepath to a pre-existing Agisoft Metashape project here if it is to be loaded.
project_path: # path to Agisoft Metashape project directory, usually {photo_path}/metashape
project_crs: "EPSG::32633" # 32633 is WGS1984 UTM 33N; epsg number that corresponds to the required project crs. Look here: https://epsg.io/
subdivide_task: True # Fine-level task subdivision reduces memory by breaking processing into independent chunks that are run in series. True recommended.
enable_overwrite: False
```


```{admonition} Did you know...
:class: tip
... that you can continue processing an existing project by linking to the project file through the *load_project_path* parameter?
This allows you to inspect the processing after each step, figure out which parameters to adjust, and revise the YAML configuration accordingly.
Further processing then copies and leaves your original project unaltered.
```

```{admonition} Did you know...
:class: tip
... that the output shown while processing is also stored in a log file in the *output_path*?
It even has all the implemted YAML parameter-sections, software versions, and computer specs.
It can be easily used to reprocess and exactly repeat the processing.
```
