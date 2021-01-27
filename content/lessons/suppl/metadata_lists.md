# Metadata templates for archiving

````{tabbed} Hand-sized samples

```{admonition} Final list TBD
:class: warning

Keep in mind that the metadata form below is still undergoing active development.
The final form required for archiving may therefore not be compatible with the one below.
```

```yaml
# This is an example yaml configuration for the archiving of a digitised rock/handsample.
# The name is automatically generated as a function of locality + rock_type.
# E.g.: Maaykedalen shale.

# Geological information
geo_rock_type:  # shale, sandstone, etc. keep all lowercase. If multiple, use the itemisation below instead and leave empty.
#    - shale
#    - sandstone
geo_supergroup:
geo_group:
geo_formation:
geo_member:
geo_bed:

# Sample information
sample_age:  # in case it has been scientifically determined
sample_description:  
sample_type: # drill core, pebble, etc.
sample_weight: # weight of sample in grams.

# Sampling data
sampling_date:  #YYYYMMDD
sampling_contact:  # Person who sampled it. If multiple, use the itemisation below instead and leave empty and remove the preceding # symbols
#    -
#    -
sampling_longitude_wgs84:  # DD.decimals in WGS84
sampling_latitude_wgs84:  # DD.decimals in WGS84
sampling_locality:  # Where was the sample sampled? Outcrop name
sampling_area:  # In which area was the sample sampled? Valley/fjord/mountain
sampling_region:  # In which region was the sample sampled? Think Spitsbergen, Nordaustlandet, etc.

storage_location: non-existing # Description on where&how the data has been stored, or used for e.g. experiments.
storage_analysis:

# Processing data/3d models:
digital_images_used:  # how many photos were used for the model
digital_camera_used:  # version number of the camera lens
digital_lens_used:  # version number of the camera lens
digital_imaging_distance:  #i.e., flying altitude from report
digital_ground_resolution:  #i.e., resolution stated in the processing report.
digital_sketchfab_id:  #i.e., unique id obtained after uploading model to SketchFab
digital_control_point_no:  #i.e., how many control points were used.

# remaining metadata:
unis_project_no:
unis_project_campaign: # Same as in the project_config_setting
owner:
data_path:
comment:
```
````

````{tabbed} Digital outcrop models

```{admonition} Final list TBD
:class: warning

Keep in mind that the metadata form below is still undergoing active development.
The final form required for archiving may therefore not be compatible with the one below.
```

```yaml
data:
    data_project_path: C:\Users\Peter\Downloads\UNIS_3051_20180827_Spit_Sarstangen_Sarsoyra1_U # FOLDER DIR (absolute)
    data_model_file: {model_filename}.obj # MODEL FILE NAME (relative to data_path)
    data_model_crs_epsg: 32633 # INT EPSG number of model CRS
    data_owner:
    data_reference_contact:
    data_reference_scientific:

metadata:
    acquisition_date: 10.12.2019 # STRING DD.MM.YYYY
    acquisition_vehicle: Boat # PICK Boat / UAV / Handheld / Combination
    acquisition_reference: Peter Betlem # STRING Data collector
    acquisition_camera_model: iPad mini 4
    acquisition_marker_type:
    acquisition_camera_lens:
#
    location_locality: Longyearbyen # STRING
    location_land: # PICK Albert I Land / Andrée Land / Bünsow Land / Dickson Land / Haakon VII Land /
#       Heer Land / James I Land / Nathorst Land / Nordenskiöld Land / Ny-Friesland / Olav V Land /
#       Oscar II Land / Sabine Land / Sørkapp Land / Torell Land / Wedel Jarlsberg Land / Gustav Adolf Land /
#        Gustav V Land / Orvin Land
    location_island: Edgeøya # Island the outcrop is found oni#     PICK: Hopen / Spitsbergen / Kong Karls Land / Edgeøya / Barentsøya /
#        Tusenøyane / Nordaustlandet / Kvitøya / Prins Karls Forland / Bjørnøya / Other
#
    processing_camera_stations: 267
    processing_camera_total_error: 10
    processing_ground_resolution: 0.00345 # in metres/pixel
    processing_dem_resolution: 0.0138 # in metres/pixel
    processing_dem_point_density: 0.526 # in points/m2
    processing_flying_altitude: 10.8 # in m, average distance between cameras and sparse point cloud
    processing_coverage_area: 932.0 # in m2
    processing_georeferencing_type:
    processing_georeferencing_crs:
    processing_reference_contact: Peter Betlem
#
    publishing_sketchfab_id: bf3b54faa2554771a6c49c30638544fb
    publishing_svalbox_post_id: # automatically supplied, just for reference
    publishing_svalbox_img_id: # automatically supplied, just for reference
    publishing_dom_id: # automatically supplied, just for reference
    publishing_date_archived: # automatically supplied, just for reference
    publishing_date_revised: # automatically supplied, just for reference
#
    unis_project_no:
    unis_project_owner:
#
    comments:
```
````
