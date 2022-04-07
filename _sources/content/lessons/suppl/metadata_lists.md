# Metadata templates for archiving

````{tabbed} Outcrop and hand-sized samples

acq_camera_lens: # STRING camera lens indicated in proc report in mm
acq_camera_model: # STRING camera model indicated in proc report.
acq_date: # STRING DD.MM.YYYY
acq_georeferencing: # STRING, pick: built-in GPS, dGPS, GCPs, GCPs/GPS, GCPs/dGPS
comments:
#
data_author:
  - name:
    affiliation:
    orcid:
  - name: Betlem, Peter
    affiliation: UNIS, UiO, NCCS
    orcid: 0000-0002-6017-9415
#
data_model_crs_epsg: 32633 # INT EPSG number of model CRS
data_model_file_name: {filename}.obj # STRING with model file name and obj extension.
data_project_path: # full path
data_type: DOM
#
funding:
  - organization:
    grant_number:
geology_age:
  - Era:
    Formation:
    Group:
    Period:
geology_lithology:
  - lithology:
    grainsize:
geology_tags:
  - Category:
    Subcategory:
keywords: # Separated by ;. Last item without.
#
location_altitude: # altitude used for hand sample models
location_easting: # easting used for hand sample models
location_island: # Island the outcrop is found on PICK: Hopen / Spitsbergen / Kong Karls Land / Edgeøya / Barentsøya / Tusenøyane / Nordaustlandet / Kvitøya / Prins Karls Forland / Bjørnøya / Other
location_land: # PICK Albert I Land / Andrée Land / Bünsow Land / Dickson Land / Haakon VII Land / Heer Land / James I Land / Nathorst Land / Nordenskiöld Land / Ny-Friesland / Olav V Land / Oscar II Land / Sabine Land / Sørkapp Land / Torell Land / Wedel Jarlsberg Land / Gustav Adolf Land / Gustav V Land / Orvin Land
location_locality:
location_northing: # northing used for hand sample models
#
proc_alignment_accuracy:
proc_camera_stations:
proc_camera_total_error:
proc_coverage_area: # kmÂ²
proc_dc_filter_conf_min: # changed from proc_dense_cloud_confidence_minimum
proc_dem_point_density: # points/mÂ²
proc_dem_resolution: # m/pix
proc_depth_map_accuracy:
proc_flying_altitude: # m
proc_georeferencing_count: # number of gcps used
proc_georeferencing_crs: # INTEGER, epsg CRS number
proc_georeferencing_type: # STRING, e.g., Aruco or Agisoft markers, also indicate marker version.
proc_ground_resolution: # m/pix
proc_mesh_filter_con_comp:
proc_sc_filter_proj_acc:
proc_sc_filter_recon_uncert:
proc_sc_filter_reproj_error:
proc_software:
proc_software_version:
proc_volume: # volume of the digitized handsample in cm3
publ_embargo:
#
publ_related_identifiers:
  - identifier:
    relation:
publ_sketchfab_id:
publ_v3geo_model:
#
unis_project_campaign:
unis_project_no:

```yaml
# This is an example yaml configuration for the archiving of a digitised rock/handsample/outcrop.
# The name is automatically generated.


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
