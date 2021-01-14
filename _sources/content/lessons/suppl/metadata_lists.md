# Meta data lists for archiving

````{tabbed} Hand-sized samples
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
