# Metadata templates for archiving

````{tabbed} Hand-sized samples

```{admonition} Final list TBD
:class: warning

Keep in mind that the metadata form below is still undergoing active development.
The final form required for archiving may therefore not be compatible with the one below.
```

```yaml
# This is an example yaml configuration for the archiving of a digitised rock/handsample.
# The name is automatically generated.

# Data
data_project_path: C:\Users\Peter\Downloads\UNIS_3051_20180827_Spit_Sarstangen_Sarsoyra1_U # FOLDER DIR (absolute)
data_model_file: {model_filename}.obj # MODEL FILE NAME (relative to data_path)
data_model_crs_epsg: 32633 # INT EPSG number of model CRS
data_owner:
data_reference_contact:
data_reference_scientific:
#
# metadata:
# Geological information
geo_rock_type:
geo_supergroup:
geo_group:
geo_formation:
geo_member:
geo_bed:
#
# sample information
sample_age:  # in case it has been scientifically determined
sample_description:  
sample_type: # drill core, pebble, etc.
sample_weight: # weight of sample in grams.
#
# sampling data
sampling_date:  #YYYYMMDD
sampling_contact:  # Person who sampled it. If multiple, use the itemisation below instead and leave empty and remove the preceding # symbols
#    -
#    -
sampling_longitude_wgs84:  # DD.decimals in WGS84
sampling_latitude_wgs84:  # DD.decimals in WGS84
sampling_locality:  # Where was the sample sampled? Outcrop name
sampling_land:  # In which area was the sample sampled? Valley/fjord/mountain
sampling_island:  # In which region was the sample sampled? Think Spitsbergen, Nordaustlandet, etc.
#
# storage info
storage_location: non-existing # Description on where&how the data has been stored, or used for e.g. experiments.
storage_analysis:
storage_contact:
#
# digital processing info
processing_date: 10.12.2019 # STRING DD.MM.YYYY
processing_camera_model: iPad mini 4
processing_camera_lens:
processing_georeferencing_marker_type:
processing_georeferencing_marker_count:
processing_camera_stations: 267
processing_camera_total_error: 10
processing_ground_resolution: 0.00345 # in metres/pixel
processing_dem_resolution: 0.0138 # in metres/pixel
processing_dem_point_density: 0.526 # in points/m2
processing_flying_altitude: 10.8 # in m, average distance between cameras and sparse point cloud
processing_coverage_area: 932.0 # in m2
processing_reference_contact: Peter Betlem  
#
# publishing info
publishing_sketchfab_id: bf3b54faa2554771a6c49c30638544fb
publishing_svalbox_post_id: # automatically supplied, just for reference
publishing_svalbox_img_id: # automatically supplied, just for reference
publishing_date_archived: # automatically supplied, just for reference
publishing_date_revised: # automatically supplied, just for reference
#
# remaining metadata:
svalbox_hsm_id: # automatically supplied, just for reference
unis_project_no:
unis_project_campaign:
#
comments:
```
````

````{tabbed} Digital outcrop models

```yaml
# Data:
data_project_path: C:\\Path\to\data\here # STRING with folder directory (absolute)
data_model_file_name: filename.extension # STRING with model file name and obj extension.
data_model_crs_epsg: 32633 # INT EPSG number of model CRS
data_author: # Uncomment each line which you want to use by removing the '#'
    - name: Surname, First Name(s)
#      affiliation: Affiliation1, Affiliation2, Affiliation3, ...
#      orcid: xxxx-xxxx-xxxx-xxxx

# Metadata:
acq_date: DD.MM.YYYY # STRING DD.MM.YYYY
acq_camera_model: # STRING camera model indicated in proc report.
acq_camera_lens: # STRING camera lens indicated in proc report.
acq_georeferencing: # STRING, pick: built-in GPS, dGPS, GCPs, GCPs/GPS, GCPs/dGPS
#
location_locality: # STRING Location name
location_land: # PICK Albert I Land / Andrée Land / Bünsow Land / Dickson Land / Haakon VII Land /
#       Heer Land / James I Land / Nathorst Land / Nordenskiöld Land / Ny-Friesland / Olav V Land /
#       Oscar II Land / Sabine Land / Sørkapp Land / Torell Land / Wedel Jarlsberg Land / Gustav Adolf Land /
#        Gustav V Land / Orvin Land
location_island: Spitsbergen # Island the outcrop is found on PICK: Hopen / Spitsbergen / Kong Karls Land / Edgeøya / Barentsøya /
#        Tusenøyane / Nordaustlandet / Kvitøya / Prins Karls Forland / Bjørnøya / Other
#
proc_software: Agisoft Metashape # Write down software name here
proc_software_version: 1.7.1.11797 # And software version, including build number

proc_camera_stations: # INTEGER, number of photos
proc_camera_total_error: # FLOAT, in metres found in proc report (e.g., 4.116)
proc_ground_resolution: # FLOAT in metres/pixel found in proc report
proc_dem_resolution: # FLOAT in metres/pixel found in proc report
proc_dem_point_density: # FLOAT in points/m2 found in proc report
proc_flying_altitude: # FLOAT in metres, average distance between cameras and sparse point cloud
proc_coverage_area: # FLOAT in km squared
proc_georeferencing_type: # STRING, e.g., Aruco or Agisoft markers, also indicate marker version.
proc_georeferencing_crs: # INTEGER, epsg CRS number
publ_sketchfab_id: #
#
unis_project_no: # STRING, UNIS project number funding acq
unis_project_campaign: # STRING, campaign
funding: # Uncomment each line which you want to use by removing the '#'
    - name: Norwegian Research Council
#      grant_number:
#    - name: ABC2
#      grant_number: asdasx/a
#
comments: All other comments go here...
keywords: separate; each; keyword; by; semi-colons
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
