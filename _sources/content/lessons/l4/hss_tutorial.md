# Hand-sized samples exercise: food for thought

```{admonition} Deadline
Please complete these exercises **by the end of the current session**.
```

## Digital bananas

Agisoft has been so kind to publish a tutorial on the digitisation of hand-sized samples, which we will follow and adept for to-scale digitisation.

```{sidebar} Banana for Scale

Based on the material covered in [session 2](../l2/overview "overviewl2"):
- How would you proceed to get a digital model with dimensions equivalent to the real object?
- What should be the lowest number of *photo haloes* around an object?
- Once all has been decided, is there any possibility of throwing in automated processing?
```

Have a look at the following [Metashape tutorial](https://agisoft.freshdesk.com/support/solutions/articles/31000158967-aligning-turntable-photos-with-background-suppression-from-single-mask-in-agisoft-metashape), and proceed by digitising either the *banana* or the *water jug*.
All required material is linked to from within the tutorial.
As an added exercise, make sure to create the [standardised project directory](../l1/tutorial#a-standardised-project-environment "tutorialstandard") and fill out the metadata form found below.

````yaml
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
sample_age:
sample_description:  
sample_type: # drill core, pebble, etc.

# Sampling data
sampling_date:  #YYYYMMDD
sampling_contact:  # Person who sampled it
sampling_longitude_wgs84:  # DD.decimals in WGS84
sampling_latitude_wgs84:  # DD.decimals in WGS84
sampling_locality:
sampling_area:
sampling_region:

storage_location: non-existing # Description on where&how the data has been stored, or used for e.g. experiments.
storage_analysis:

# Processing data/3d models:
digital_images_used:
digital_camera_used:
digital_lens_used:
digital_imaging_distance:  #i.e., flying altitude from report
digital_ground_resolution:
digital_sketchfab_id:
digital_control_point_no:

# remaining metadata:
unis_project_no:
unis_project_campaign: # Same as in the project_config_setting
owner:
data_path:
comment:
````
