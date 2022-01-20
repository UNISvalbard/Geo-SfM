# GIS 101

A geographic information system (GIS) is a key component to integrate data geospatially, i.e., linking data to their physical locations on Earth.
GIS is one of the way in which you can access the metadata of your georeferenced 3D model easily.
It is the system that forms the foundation to almost everything that is Svalbox.
In other words, everyone should at the very least grasp the basics - hence the need for this section.

```{admonition}
:class: warning

This page contains bits and pieces from all over the internet, supplemented by work by Peter Betlem and Nil Rodes.
It's only use is to help form a basic understanding of GIS.
```

## Some useful definitions

````{margin}
```{note}
As in every field, there are some common phrases and definitions that are frequently used.
Here we provide you with some of them.
```
````

ESRI
: Esri is an international supplier of geographic information system software, web GIS and geodatabase management applications.
The company was founded as the Environmental Systems Research Institute in 1969 as a land-use consulting firm.
Esri has tons of resources and online help for any kind of GIS questions.  

ArcGIS
: ArcGIS is a geographic information system (GIS) for working with maps and geographic information maintained by the Environmental Systems Research Institute (Esri).
It is used for creating and using maps, compiling geographic data, analyzing mapped information, sharing and discovering geographic information, using maps and geographic information in a range of applications, and managing geographic information in a database.

ArcGIS Pro
:  A new, integrated GIS application, planned to eventually supersede ArcMap and its companion programs.

QGIS
: QGIS is a free and open-source cross-platform desktop geographic information system application that supports viewing, editing, and analysis of geospatial data.

Layer
: Layers are the mechanism used to display geographic datasets.
Each layer references a dataset and specifies how that dataset is portrayed using symbols and text labels.
When you add a layer to a map, you specify its dataset and set its map symbols and labeling properties.
Each map, globe, or scene document in ArcGIS is assembled by adding a series of layers.
Layers are displayed in a particular order displayed in the map's table of contents. Layers listed at the bottom are displayed first, followed by the layers above them.

ShapeFile
: A shapefile is an Esri vector data storage format for storing the location, shape, and attributes of geographic features.
It is stored as a set of related files and contains one feature class.
Shapefiles often contain large features with a lot of associated data and historically have been used in GIS desktop applications such as ArcMap.
A shapefile consists of multiple components, containing at least the .shp, .shx, .dbf, and .prj files.
A better option is to use the opensource GeoPackage equivalent.

GeoPackage
: An open source storage format for storing the location, shape, and attributes of geographic features.
May feature many different feature classes and files.

Feature Class
: Feature classes are homogeneous collections of common features, each having the same spatial representation, such as points, lines, or polygons, and a common set of attribute columns, for example, a line feature class for representing road centerlines.
The four most commonly used feature classes are points, lines, polygons, and annotation (the geodatabase name for map text).

Points
: Features that are too small to represent as lines or polygons as well as point locations (such as GPS observations).

Lines
: Represent the shape and location of geographic objects, such as street centerlines and streams, too narrow to depict as areas.
Lines are also used to represent features that have length but no area, such as contour lines and boundaries.

Polygons
: A set of many-sided area features that represents the shape and location of homogeneous feature types such as states, counties, parcels, soil types, and land-use zones.

Annotation
: Map text including properties for how the text is rendered. For example, in addition to the text string of each annotation, other properties are included such as the shape points for placing the text, its font and point size, and other display properties. Annotation can also be feature linked and can contain subclasses.  


## Creation of a ArcGIS Pro project

`````{margin}
````{note}
An excellent albeit bit long guide for QGIS exists on the interwebz.
Those who would like an open and free experience, may try QGIS and follow the tutorial here:
```
https://www.qgistutorials.com/en/
```
````
`````

New, Blank Templates, Map. Define the Name of the new project (ideally without spaces, dots, or commas).
In Location, define the folder path where you want to save the project.
This last step is important to have a good data structure because everything related to your project will be saved there.
Also, select the tick that says "Create a new folder for this project".

### Adding data

#### Importing GPX tracks

ArcGIS Pro uses a Georeferencing tool to import GPX tracks.

#### Importing a digital terrain model

##### Creating slopes

### Connecting to ArcGIS Servers

#### Svalbox server

##### Harvesting metadata: 360image to iframe

Once the Svalbox ArcGIS server has been added to your project, drag and drop the images360 layer into your map.
The location of 360 images should now be visible on your map.
However, when clicking on them, you will not be shown the 360 image in the way it is served to you on svalbox.no/map.
Instead, a popup featuring all the image's metadata will show up.
Here, the most important is to copy the svalbox_i0wpurl link - this link can be pasted into the [Pannellum panorama url link box]{https://pannellum.org/documentation/overview/tutorial/} to generate a 360 view of the image.  

#### NPI server
