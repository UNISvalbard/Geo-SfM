# Exercise 1 - learning the ropes of SfM photogrammetry

```{admonition} Deadline
Please complete this exercise **by the start of the next session**.
```

## Learning goals

**After this session you will be able to:**

- Use Agisoft Metashape to digitally reconstruct macro-objects, outcrops, and more.
- Discover and implement basic tips and tricks for data acquisition

```{admonition} Support
:class: warning
Please note that **we only provide feedback and support for students enrolled in the course at the University Centre of Svalbard**.
```

We now focus on the reconstruction of a model of our own.
Split up into separate tasks, we would like you to cover the following goals in groups of 3:

- Image acquisition of an object of your choosing
- SfM photogrammetry of the object you imaged
- Archiving of the dataset in a standardised way
- Documenting the processing steps.

The exercise also includes a deliverable, i.e., a set of requirements that are listed further below.

## Assignment

```{sidebar} What about ... ?

- What geological applications do you think this would be useful for?
- What could the weaknesses be?
- What should you consider before even acquiring the data? (e.g. scale, resolution, precision requirements - purpose?)
- What is an artifact and how may they arise in your models? (Make screenshots of these when/if found in your own models!)
```

It is now up to you to acquire your own data set and process this by following the [photogrammetry tutorial](../l1/tutorial "tutorial").
Make sure to also give some thoughts and answer the questions in the side bar.

Suggested targets include:

- small outcrops (ca. 5 m long, 5 m high)
- a mug turned upside down
- a pirate's hat
- some fruit

```{admonition} Checklist and questions
:class: note
- [ ] Find a suitable target
- [ ] Take photos of the target
  - [ ] ... from two distances
  - [ ] ... from two angles
  - [ ] ... with photos having at least 80% overlap between them
- [ ] Import the photos to your workstation...
- [ ] ... into the standardised folder structure
- [ ] Create a textured model, saving project into the assigned folder
- [ ] Export a processing report.
- [ ] Fill out the deliverable
```

### Deliverable

At the very least, the following should be completed **prior to the start of the next session**.
Copy it over and send it in to the course responsible.

```
group:
    name:
    person1:
    person2:
    person3:
    person4:
    ...
model:
    place: # Where did you find your target?
    land:
    island:  # PICK: Hopen / Spitsbergen / Kong Karls Land / Edgeøya / Barentsøya / Tusenøyane / Nordaustlandet / Kvitøya / Prins Karls Forland / Bjørnøya / Other

data:
    data_project_path: C:\Users\Peter\Downloads\UNIS_3051_20180827_Spit_Sarstangen_Sarsoyra1_U # FOLDER DIR (absolute)
    data_model_file: {model_filename}.obj # MODEL FILE NAME (relative to data_path)
    data_owner:
    data_reference_contact:
    data_reference_scientific:

metadata: # these can all be found in the exported processing report :)
    acquisition_date: 10.12.2019 # STRING DD.MM.YYYY
    acquisition_reference: # STRING Data collector
    acquisition_camera_model:
    acquisition_marker_type:
    acquisition_camera_lens:
    processing_camera_stations: # a number
    processing_camera_total_error:
    processing_ground_resolution: 0.00345 # in metres/pixel
    processing_dem_resolution: 0.0138 # in metres/pixel
    processing_dem_point_density: 0.526 # in points/m2
    processing_flying_altitude: 10.8 # in m, average distance between cameras and sparse point cloud
    processing_coverage_area: 932.0 # in m2
    processing_georeferencing_type:
    processing_georeferencing_crs:
    processing_reference_contact:
```

```{admonition} Do not forget...
:class: warning

Make sure to also create a *description.txt* file with a description of the object and selecting an overview image.
Save these within the project directory with the suggested filenames (*description.txt*, *image_overview.jpg*).

```


```{note}
:class: tip
As for the metadata, you'll only be able to fill out some of the metadata after fully implementing all the steps (and including up to) the meshing and texturing step.
```

```{admonition} Image acquisition
:class: tip
Have a look at the [supplementary information](../suppl/best_practices "suppl") dealing with best practices in photogrammetry.
```

```{admonition} SfM photogrammetry workflow
:class: tip
Have a look at this session's accompanying [tutorial](../l1/tutorial "tutorial") for some useful tips and tricks.
```
