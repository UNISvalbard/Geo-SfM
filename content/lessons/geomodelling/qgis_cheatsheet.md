(qgis:cheatsheet)=
# Interpreting in QGIS

QGIS is an open-source GIS application.
QGIS (version 3.36 and later; released early 2024) have the ability to display 3D data natively within the 3D map type, with future updates aimed at addressing 3D annotations and interpretation. QGIS supports the display of 3D Tiled models (.json type) and has extensive support for 3D Point Clouds (much better than ArcGIS Pro).

The latest version can be downloaded for free at the QGIS project website:

https://www.qgis.org/en/site/

A very extensive *Training manual* is available through the QGIS documentation pages, available [here](https://docs.qgis.org/3.34/en/docs/training_manual/index.html).
Where in doubt, visit these pages and use the *Search docs* function to find what you are after.

Found below is a quick/cheatsheet overview of how outcrop data (point clouds/tiled models) can be integrated into QGIS, visualised and interpreted.
Where relevant, it points to the QGIS Documentation pages for the most up-to-date information and workflows.
Specifically, this tutorial details the following steps:
-	Addition of the 3D scene map/viewer
-	The unpacking of the 3Tz archive into a json-type 3D Tiled model
-	Addition of 3D Tiled model data sets that were generated through Agisoft Metashape
-	Interactions with 3D Tiled Models
-   Importing of 3D Point Cloud data in .laz file format


## Enabling 2D/3D map view

The creation and exploration of the QGIS map interface is neatly outlined in the QGIS documentation pages, specifically in [2. Module: Creating and Exploring a Basic Map](https://docs.qgis.org/3.34/en/docs/training_manual/basic_map/index.html).
Lessons [2.1](https://docs.qgis.org/3.34/en/docs/training_manual/basic_map/overview.html) and [2.2](https://docs.qgis.org/3.34/en/docs/training_manual/basic_map/preparation.html) introduce the interface and addition of layers, respectively.


## Creating and editing 2D vectors 

The creation of vector data sets is well documented in the QGIS documentation pages, specifically in [5.1 Lesson: Creating a New Vector Dataset](https://docs.qgis.org/3.34/en/docs/training_manual/create_vector_data/create_new_vector.html).
Follow along the QGIS 5.1 tutorial to quickly learn how to create new layers and fields (=attributes), as well as how to annotate the 2D maps.

```{admonition} QGIS Lesson 5.1.2
:class: suggestion

Although not directly related to vector data, QGIS Lesson 5.1.2 shows how to implement raster data into the QGIS project.
Relevant raster data can be geological map data, as well as digital terrain maps.

```

More in-depth tutorial on how to work with vector data is covered in [16. Working with Vector Data](https://docs.qgis.org/3.34/en/docs/user_manual/working_with_vector/index.html), and especially 16.1.1 through 16.1.4 are worth looking at, in addition to [section 16.1.17 that details the use of Elevation properties](https://docs.qgis.org/3.34/en/docs/user_manual/working_with_vector/vector_properties.html#elevation-properties).
The latter is key when displaying data in the 3D data viewer (see below).

## Visualising and exploring 3D data

```{figure} assets/qgis/qgis_3dmap.gif
---
height: 400px
name: qgis_3dmap
---
The 3D map interface can be opened by going into *View* > *3D map views* and selecting either an existing Map item, or creating a new one. 
This opens in another window.
```

```{figure} assets/qgis/qgis_3dmap_movement.gif
---
height: 400px
name: qgis_3dmap_movements
---
The 3D map interface has its own widget for moving the viewer (it sits in the top right corner).
Otherwise, one may also use the mouse/pointer to change the view.
```

The following mouse clicks are supported by the QGIS 3D map viewer.
First, make sure you have selected the *hand* symbol in the 3D map menubar, then

- {kbd}`left-click`+{kbd}`hold`+{kbd}`move` to move along the 3D space.
- {kbd}`right-click`+{kbd}`hold`+{kbd}`move` to zoom in/out.
- {kbd}`middle-click`+{kbd}`hold`+{kbd}`move` to rotate around the clicked point.

### Adding elevation to the 3D map

Data sets can be draped over a digital elevation model and shown in the 3D map.
This behaviour is toggled through the 3D map settings, accessible from the menu (click wrench symbol), then *Configure...* ({numref}`qgis_3dmap_settings`).

```{figure} assets/qgis/qgis_3dmap_settings.gif
---
height: 400px
name: qgis_3dmap_settings
---
The 3D map configuration/settings window.
```

Make sure to Toggle the *Terrain* option under *Terrain*, then set the terrain type accordingly:

- *Flat Terrain*: flat surface (with uppermost layer from the Layers Pane projected)
- *DEM (Raster Layer)*: requires to set an *Elevation* data set. Basisdata_6602-4.... is a high-resolution Digital terrain model from Kartverket and very suitable for this. Offset gives the data a vertical offset.

(qgis:3dtiles)=
## Visualising and exploring 3D Tile sets

As discussed in the QGIS Documentation pages section [21. Working with 3D Tiles](https://docs.qgis.org/3.34/en/docs/user_manual/working_with_3d_tiles/3d_tiles.html), QGIS supports 3D tiles natively since version 3.34.
However, its support is limited to certain file formats, which is currently only the *.json* data type rather than the *.3tz* zipped folder structure exported by Agisoft Metashape and used by ArcGIS Pro.

The downside of the *.json* format is that it requires unzipping of the *.3tz* zipped folder format, thus increasing file size and number.
This can be easily done by e.g. the 7Zip file manager.

```{admonition} Be careful extracting the data in OneDrive/SharePoint!
:class: warning

Given that a single *.3tz*, once unpacked to the *.json* format, results in many thousands of files, it is not recommended to unpack these data within a OneDrive/Sharepoint environment.
OneDrive may crash repeatedly as it cannot handle the hundred thousand+ files...
This is also the reason these data are shared in the *.3tz* archive format instead.
```

```{figure} assets/qgis/qgis_add_3dtiles.gif
---
height: 400px
name: qgis_add_3dtiles
---
Once the 3dtiles archive has been unpacked, adding it into QGIS is as simple as dropping the *.json* into the desired QGIS project.
```

```{figure} assets/qgis/qgis_rename_3dtiles.gif
---
height: 400px
name: qgis_rename_3dtiles
---
Make sure to rename the 3dtiles accordingly!
Otherwise it may be difficult to keep the data sets apart!
```

Once the 3d tiles have been loaded in, they appear as a high-resolution texture/orthomosaic in your 2D window
That makes sense, as they are essentially 3D orthomosaics.


## Importing .Laz/.Las point cloud data

The addition of .laz/.las files to a QGIS project is similar to the importing of 3d tiles data, shown in {numref}`qgis_add_laz`.

```{admonition} Crashes? Save often!
:class: warning

Given the large file sizes of the point data sets, it is best to save the QGIS project before adding data.
```

```{figure} assets/qgis/qgis_add_laz.gif
---
height: 400px
name: qgis_add_laz
---
Make sure to rename the 3dtiles accordingly!
Otherwise it may be difficult to keep the data sets apart!
```

Simply drag and drop the *.laz* or *.las* files into the project, and it will show up.
When adding data for the first time, QGIS processes the data set (which takes time), during which it may sporadically hang/crash.
Once processing is done, an additional file is generated (with *.copc.laz/las* extension) - future imports will go much smoother!

### Styling .Laz/.Las point cloud data

When styling 3D data such as these point clouds, it is important to always select the same symbology/styling for both the 2D and 3D maps.

```{figure} assets/qgis/qgis_laz_attributes_colour.gif
---
height: 400px
name: qgis_laz_attributes_colours
---
Unlike ArcGIS Pro, QGIS allows one to style Point Data also based on custom data attributes, such as the drilling parameters! (Win! :D)
Right click the layer you wish to modify, then select *Properties*, and head over to *Symbology*.
There, change the *Attribute* that is visualised, and change any of the other colour properties to your desire.
```

```{figure} assets/qgis/qgis_laz_attributes.gif
---
height: 400px
name: qgis_laz_attributes
---
Make sure to set the 3D styling to be the same as the 2D styling.
```

```{figure} assets/qgis/qgis_3dmap_colors.gif
---
height: 400px
name: qgis_laz_attributes_3d
---
As you can see, changing the attributes styling changes it across both the 2D and 3D maps.
```
