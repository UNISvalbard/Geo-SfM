# Metadata templates for archiving

````{tabbed} Outcrop and hand-sized samples
```yaml
acq_camera_lens:  # Camera lens as indicated in the Agisoft Metashape processing report.. Unit: mm
acq_camera_model:  # Camera model as indicated in the Agisoft Metashape processing report.
acq_date:  # Acquisition date of data, in DD.MM.YYYY format.
comments:  # comments for data entry
cover:
- Category: Snow
  Extent: # pick from 0-5; 0=0%, 1=0-20%, 2=20-40%, 3=40-60%, 4=60-80%, 5=80-100%
- Category: Scree
  Extent: # pick from 0-5; 0=0%, 1=0-20%, 2=20-40%, 3=40-60%, 4=60-80%, 5=80-100%
data_author:
- affiliation:  # affiliations of author in comma-separated list
  name:  # name of author
  orcid:  # orcid ID of author
- affiliation:  # affiliations of author in comma-separated list
  name:  # name of author
  orcid:  # copy paste for number of authors applicable.
data_doi:  # doi number (without https://doi.org/)
data_model_file_name: {filename}.obj # STRING with model file name and obj extension.
data_project_path:  # STRING with full path to the standardized data project.
data_type: DOM # Data type, defaults to DOM. Other options include DCM, DSM
funding:
- grant_number:  # grant number or name associated with the grant
  organization:  # organization identifier
- grant_number:  # Copy paste for all applicable combinations.
  organization:  # organization identifier #2
geology_age:
- Era: # Pick from
  Formation:  #
  Group: #
  Period: # Pick
- Era: # Pick from
  Formation:  # Copy paste for all applicable combinations.
  Group: #
  Period: # Pick
geology_tags:
- Category: # Pick from Structure/Sedimentology/Metamorphic/Igneous/Quaternary
  Subcategory: # Pick matching Subcategory from [Structure/]Dikes/Sills/Karsts/Folds/Extensional/Compressional/Faults/Joints/Fractures/Veins/Inversion or [Sedimentology/]Clastic/Carbonates and Evaporites or [Igneous/]Intrusive/Extrusive
- Category: # Pick from Structure/Sedimentology/Metamorphic/Igneous/Quaternary
  Subcategory: # Pick matching Subcategory from [Structure/]Dikes/Sills/Karsts/Folds/Extensional/Compressional/Faults/Joints/Fractures/Veins/Inversion or [Sedimentology/]Clastic/Carbonates and Evaporites or [Igneous/]Intrusive/Extrusive (select as many combinations as applicable)
keywords:  # list of keywords separated by ;. Last item without.
location_island:  # Island on which the locality is found, pick from Hopen / Spitsbergen / Kong Karls Land / Edgeøya / Barentsøya / Tusenøyane / Nordaustlandet / Kvitøya / Prins Karls Forland / Bjørnøya / Other
location_land:  # Land in which the locality is found, pick from Albert I Land / Andrée Land / Bünsow Land / Dickson Land / Haakon VII Land / Heer Land / James I Land / Nathorst Land / Nordenskiöld Land / Ny-Friesland / Olav V Land / Oscar II Land / Sabine Land / Sørkapp Land / Torell Land / Wedel Jarlsberg Land / Gustav Adolf Land / Gustav V Land / Orvin Land
location_locality:  # Location/area in which the locality is found. This should only contain valley/mountain names and not contain directions.
model_description:  # Brief (geological) description of the data.
proc_alignment_accuracy:  # Photo alignment processing value for generating depth maps. Pick from Highest, High, Medium, Low, Lowest.
proc_camera_stations:  # Total number of aligned, as stated in the Agisoft Metashape processing report files.
proc_camera_total_error:  # Total error of the cameras, as stated in the Agisoft Metashape processing report files.. Unit: m
proc_coverage_area:  # Area covered by the DOMs footprint, as stated in the Agisoft Metashape processing report files.. Unit: km2
proc_dc_filter_conf_min:  # Minimum dense cloud confidence value used for dense cloud filtering.
proc_dem_point_density:  # Point density of the DEM, as stated in the Agisoft Metashape processing report files.. Unit: points/m2
proc_dem_resolution:  # Resolution of the DEM, as stated in the Agisoft Metashape processing report files.. Unit: m
proc_depth_map_accuracy:  # Depth map processing value for generating depth maps. Pick from Highest, High, Medium, Low, Lowest.
proc_flying_altitude:  # Average distance between the camera and the object, as stated in the Agisoft Metashape processing report files.. Unit: m
proc_gcp_total_error:  # Total error of the georeferencing control points, as stated in the Agisoft Metashape processing report files.. Unit: cm
proc_georeferencing_count:  # Number of ground control/georeferencing points used for processing.
proc_georeferencing_crs_epsg:  # EPSG crs code used by the data used for georeferencing.
proc_georeferencing_type:  # Type of data/points used for georeferencing. Marker type and version (e.g., Aruco DICT_6X6_250) should be included.
proc_ground_resolution:  # Ground resolution of the DOM, as stated in the Agisoft Metashape processing report files.. Unit: m
proc_mesh_filter_con_comp: # Mesh filter value for connected component.
proc_sc_filter_proj_acc: # Sparse cloud filter value for projection accuracy.
proc_sc_filter_recon_uncert: # Sparse cloud filter value for reconstruction uncertainty.
proc_sc_filter_reproj_error:  # Sparse cloud filter value for reprojection error.
proc_software:  # name of software used for processing.
proc_software_version:  # Software version used for processing, including build number.
publ_embargo: 6 # Currently under discussion.. Unit: months
publ_related_identifiers:
- identifier:
  relation: # Please visit the https://developers.zenodo.org/ for examples.
publ_sketchfab_id:  # integer number associated with the data entry on the sketchfab. https://sketchfab.com/models/{SketchFab ID}
publ_v3geo_model: # The V3Geo model ID (obtained after submission on V3Geo)
```
````

````{tabbed} Digital drill core models

```yaml
data_project_path: dir/to\path
data_owner: Svalbox
data_reference: Peter Betlem
data_cite: <a href ="https://doi.org/10.3390/rs12020330">Betlem et al. (2020)</a>
acq_date: 18.09.2019 # DD.MM.YYYY
acq_reference: Peter Betlem
acq_camera_model: ILCE-6300
acq_camera_lens: 50 mm
acq_gcp_numbers: 6
acq_gcp_space: 2D # options include 2D, 3D
borehole_identifier: DH4
borehole_name: DH4
sample_top_depth: 643.0 # m
sample_base_depth: 643.047 # m
sample_length: 4.7 # cm
sample_width: 4.1 # cm
sample_volume: 54.48 # cm3
sample_weight: 137.98 # g
sample_bulk_density: 2.53 # g/cm3
sample_lithology:
    - siltstone # str
    - sandstone
proc_camera_stations: 96 # INT
proc_camera_total_rmse: # in mm
proc_ground_resolution: 0.0374 # in mm/pix
proc_dem_resolution: 0.04 # in mm/pix
proc_dem_point_density: 624 # points/mm2
proc_dense_cloud_confidence_min:
proc_flying_altitude: 48.3 # cm
proc_coverage_area: 14.2 # cm2
proc_gcp_type: Agisoft Metashape
proc_gcp_crs_epsg: 40400
proc_gcp_total_rmse: 0.126707 # mm
proc_reference: Peter Betlem
publ_sketchfab_id: 925c0f05104b491f818925839fb5133b
unis_project_no: 123456asbas
unis_project_campaign: lightbox
comments:
```
````
