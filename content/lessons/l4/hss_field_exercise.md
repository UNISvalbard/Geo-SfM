# Exercise 4 - Digitising field samples

```{admonition} Deadline
The following exercise is to be completed **prior to the final semester presentation**.
```

{cite}`betlemDigitalDrillCore2020` present an effective method to digitise hand-sized samples at their respective scales.
While the paper focuses on drill core samples, the same GCP-based methodology can be used for most hand-sized samples from the field, minerals (e.g., Malte's mineral), and other object.

In short, the method relies on acquiring a single GCP-calibrated photo halo (i.e., 24-36 object-centered photos taken in which at least 5 well-referenced GCPs surround the object) alongside at least two additional photo haloes for which the object's orientation has been changed (see {numref}`tobedone`).
This is easily done through use of a well-lit round-table or, as present at UNIS, an [automated photography light box](../about/seismic_lab#automated-photography-lightbox "seismiclab") combined with the [automated Python scripts package](../l3/python "python").

A summary of the methodology as well as numerous tips and tricks can be found in the [Resources sections](../suppl/best_practices#Lightbox "best_practices_lightbox"), which should be explored as part of the open-ended exercise below.

## Exercise

- Whilst out on a fieldtrip, collect at least one (1) sample in which any given dimension falls between 5 and 15 centimetres;
- Write down coordinates of the exact sampling location, fill out the [sample metadata form](../suppl/metadata_lists) in full  (i.e., those fields related to the sampling, not yet processing);
- When back, process the collected sample and create a to-scale 3D digital hand-sized sample model without artefacts using the [automated photography light box procedure](best_practices_lightbox).
- Finalise the [sample metadata form](../suppl/metadata_lists) and submit/discuss it with the course responsible. This include the SketchFab ID which is only obtained after the submission has been quality controlled and the model has been uploaded to SketchFab.

````{admonition} Bulk sample density
:class: note

Seeing as your digital model is 1:1 scaled with the real sample, any idea on how to calculate its wet bulk density?

```{admonition} Metashape volume measurement
:class: tip

Metashape provides a built-in feature to determine a model's volume (*Tools/Mesh/Measure Area and Volume...*).
Be careful, though, as this calculates the total volume of *all* closed surfaces/meshes in your project.
The calculated volume is furthermore given in m3 - so make sure to apply the correct conversion.
Better yet, use some handy Python code that calculates the volumes in cm3 instead.

```
````

````{admonition} Model annotation and interpretation
:class: tip

The same tools used for interpreting and annotating digital outcrop models (DOMs) can also be used for hand-sized digital models.
Have a look at the [geomodelling tutorial](../l5/geomodel_tutorial) to get started.
````
