# Ground control points

Ground control points (GCPs) are locations that we can track with high precision and accuracy between the targeted object and a selection of our photos.
We can use these to provide "exact" real world coordinates to our reconstructed models, as well as to determine the accuracy and impact of processing parameters.

In a mapping survey, GCPs are points which can be precisely pinpointed.
This precision not only applies to the points themselves, but can also be interpolated to the mesh between GCPs.
It is therefore possible to accurately map large areas with only a handful of precisely known coordinates (up to sub-metre levels!).

```{admonition} Geo-location accuracies
We distinguish 3 different scenarios when it comes to geo-referencing:
- Horizontal - i.e., measuring longitude, latitude
- Vertical - i.e., measuring altitude
- Full - i.e., measuring longitude, latitude, and altitude

Given the way GPS works, *verical* accuracies are usually worse than *horizontal* accuracies (often by more than an order of magnitude).
Seeing as most handheld and built-in GPSs have a horizontal error of at least 1 metre, the corresponding vertical error may be large enough to prevent accurate correlation to the real world.
```

```{admonition} built-in GPS
The images taken from drones or GPS-equipped cameras store the *image location* in the image's metadata.
Metashape automatically imports this upon loading.
Do remember, however, that built-in GPSs still have quite large errors compared to differential GPS and similar.
```

## When do we need GCPs?

GCPs are essential when you need *high global accuracy* (or *absolute accuracy*) and when you need to verify the accuracy of the final models.

Applications include:
- terrain mapping (contour map, digital terrain model, etc.)
- geotechnical surveys (e.g., land titles, other assessments)
- volume measurements

Only when the area is small and we do not care about *absolute accuracy* (i.e., only *relative accuracy is important*) can we omit GCPs.
This is e.g. the case when we want to compare elements within the same models without relating these to real world properties.

## GCP design

In general, ground control points must be

- sharp
- well defined, and
- positively identifiable on at least a sub-selection of photos.

In many cases, however, markers used as GCPs should be *unique*.

We generally differentiate between *artificial* and *natural* GCPs.
Here, however, *artificial* strictly means that a marker or GCP was specifically designed and placed for the survey.
*Natural* markers include e.g. terminus of a sidewalk, sharp corner of a parking spot, a unique landscape feature (e.g., rock, peak), etc.
Artificial markers' unique appearance makes misidentification less likely, though comes at the cost of extra work and expense.

So, what makes a good marker?
Main elements in GCP design:

- GCP size
- Unique GCP symbols
- Computer readability

### GCP size

### Unique GCP shapes

While technically not a requirement, it is always preferred to be able to differentiate GCPs based on uniqueness of the marker.
That means, in its most simplistic form, one could get away with the following 4-member marker-set: o+Δ☐

```{figure} assets/common_gcps.png
:name: common_gcps

An example of GCP markers commonly employed in photogrammetry applications {cite}`cucciACCURATEOPTICALTARGET2016`.
```

Additionally, one of the most popular approaches is the use of binary fiducial markers, examples of which are shown in {numref}`common_gcps`.
With each subsequent marker slightly differing, and therefore unique, these synthetic markers are great for use as GCPs.

### Computer readability

Their standardised uniqueness furthermore allows for automisation of the marker detection step.
While not an issue when dealing with just a handful of photos, highly detailed surveys quickly expand the photo collection to hundreds, if not thousands, of photos.

While Agisoft Metashape provides a set of GCPs internally, one of the most popular approaches is the use of the [ArUco library](http://www.uco.es/investiga/grupos/ava/node/26) {cite}`garrido-juradoAutomaticGenerationDetection2014`.
In addition to exhibiting a standardised uniqueness, the ArUco-based markers are square markers and thus preferred as a single marker provides enough correspondences (i.e., its four corners) to obtain the camera pose in augmented reality applications.

```{figure} assets/aruco_markers.png
:name: aruco_markers

Example of ArUco marker images {cite}`garrido-juradoAutomaticGenerationDetection2014`.
```

```{admonition} Python-based automated marker detection
:class: suggestion

ArUco markers (50x50 cm) printed on canvas are available for use in the UNIS Arctic Geology department.
Marker detection hereof can be done by using the scripts described in {ref}`../l4/python.ipynb`.
```

## Placement of GCPs in terms of highest accuracy

An extensive review on the accuracy of GCPs types is conducted by {cite}`martinez-carricondoAssessmentUAVphotogrammetricMapping2018` and {cite}`vegaAssessmentPhotogrammetricMapping2017`, and we here only focus on the take-home messages.
These conclusions are based on an accuracy-assessment that seeks minimal root mean square errors (RMSEs) for the GCPs's longitude, latitude, and altitude.

Prior to implementing GCPs, one always has to assess the need of precision and accuracy in terms of cost, i.e., time.
In a timeless setting, one could set up an infinite amount of GCPs ({numref}`gcp_locations`, top row) and obtain the smallest GCP RMSEs in each direction.
However, when time is of the essence, there appears to be a cut-off point at which the introduction of an additional GCP does not warrant the additional time it takes to set it up.
As a result, efficiency can be gained by reducing the number of GCPs ({numref}`gcp_locations`, second row).

```{figure} assets/gcp_locations.png
:name: gcp_locations

Five different GCP distribution types and an example for the combination of 16 GCPs (second row). (a) edge distribution, (b) central distribution, (c) corner distribution (equivalent for all four corners), (d) stratified distribution, (e) random distribution. In general, the stratified distribution (d) gives rise to the lowest overall errors {cite}`martinez-carricondoAssessmentUAVphotogrammetricMapping2018`
```

Placing the GCPs around the edges and in a stratified manner throughout the survey area results in the lowest overall errors.
Therefore, best accuracies are achieved **(1) placing GCPs around the edge of the study area**, but it is also essential to **(2) place GCPs inside the area with stratified distribution to optimize vertical accuracy** {cite}`martinez-carricondoAssessmentUAVphotogrammetricMapping2018`.
As for the optimal number of GCPs in the stratified interior, try to aim for a density of around 0.5-1 GCP per hectare to minimise altimetry errors, and make sure to place GCPs throughout the entire altimetry-interval, e.g., covering both ridges and valleys.

```{admonition} Hand-sized samples
:class: suggestion
GCPs are also implemented for the digitisation of hand-sized samples.
Then, however, it is suggested to only place GCPs along the edge.
```

Finally, always make sure to properly fasten & secure your GCPs.
A moving GCP is essentially useless, and likely to give rise to major positional errors in the final models.
