# Geo-referencing

Seeing as neither the camera positions nor the 2D images are required to contain real world coordinates, the 3D point clounds that are generated through SfM photogrammetry are generated in a relative *image-space* coordinate system.
This means that in order to be quantitative, the generated point clouds need to be aligned to a real-world, *object-space* coordinate system {cite}`westobyStructurefromMotionPhotogrammetryLowcost2012`.
This transformation can be achieved using a 3D similarity transform based on either known camera locations, a small number of known ground control points (GCPs) with known object-space coordinates, or a combination of the two, which is covered in the upcoming sections of the Geo-SfM module.

```{admonition} Coordinate reference systems
:class: note

A coordinate (or Spatial) reference systems (CRS) define specific map projections and the transformations that are needed between different systems.
A CRS is always composed of a coordinate system and datum component.
A coordinate system is a set of mathematical rules that specify how coordinates are to be assigned to points.
A datum is a set of parameters that define the position of the origin, the scale, and the orientation of a coordinate system.

Luckily, these are pre-defined by the European Petroleum Survey Group (EPSG) for the most common CRSs in use {cite}`internatonalassociationofoilandgasproducersGeomaticsGuidanceNote2019`.
For example some codes often in use in Svalbard are:

- EPSG:4326 corresponds to WGS 84 longitude-latitude (used by GPS).
- EPSG:32633 corresponds to WGS 84 UTM-33N.
- EPSG:40400 is a special wildcard CRS that has no real world meaning, e.g., useful for hand samples.
```
