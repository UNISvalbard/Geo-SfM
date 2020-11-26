# Ground control points

Ground control points (GCPs) are locations that we can track with high precision and accuracy between the targeted object and a selection of our photos.
We can use these to provide "exact" real world coordinates to our reconstructed models, as well as to determine the accuracy and impact of processing parameters.

In a mapping survey, GCPs are points which can be precisely pinpointed.
This precision not only applies to the points themselves, but can also be interpolated to the mesh between GCPs.
It is therefore possible to accurately map large areas with only a handful of precisely known coordinates (up to sub-metre levels!).

```{admonition} Geo-location accuracies
We distinguish 3 different scenarios when it comes to geo-referencing:
- Horizontal - i.e., measuring lon, lat
- Vertical - i.e., measuring height
- Full - i.e., measuring lon, lat, and height

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

## Ground control design

```{note}
Work in progress
```

## Artificial vs natural GCPs

```{note}
Work in progress
```

### Placement of GCPs

```{note}
Work in progress
```
