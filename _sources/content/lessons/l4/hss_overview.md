# Small object SfM photogrammetry

The various tips and tricks learned in the previous sessions can not only be applied to human-and-larger-scale objects, but also to objects only centimetres tall.
In fact, smaller objects such as rocks make for a great way of learning SfM-photogrammetry.

A good example of a digitised handsized sample is Malte's mineral below, which has been digitised to scale through use of ground control points.

```{admonition} SketchFab 3D model
<iframe title="A 3D model" width="600" height="450" src="https://sketchfab.com/models/b2cb2ad336dd402eb3dc4222bb03d4bd/embed?autostart=0&amp;camera=0&amp;ui_controls=1&amp;ui_infos=1&amp;ui_inspector=1&amp;ui_stop=1&amp;ui_watermark=1&amp;ui_watermark_link=1" frameborder="0" allow="autoplay; fullscreen; vr" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
```

Sadly, SketchFab does not (yet?) have distance querying built-in to the frontend.
However, SketchFab Labs does provide such a feature.
Access it [here](https://labs.sketchfab.com/experiments/measurements/) or through the iFrame below; then search for *Rock sample Malte* or provide the link with model ID to load the model above and measure the sample's dimensions.

````{admonition} SketchFab 3D model (Verification)
:class: seealso

Verification of your data is key to whatever you do in life.
As such, why not ask Malte for the original rock sample and compare digital vs real dimensions?

<iframe title="A 3D model" width="600" height="450" src="https://labs.sketchfab.com/experiments/measurements/#!/" frameborder="0" allow="autoplay; fullscreen; vr" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

Load Malte's rock sample by clicking *LOAD 3D MODEL* and enter the model url:
```yaml
https://sketchfab.com/models/b2cb2ad336dd402eb3dc4222bb03d4bd
```
````

## 101 to digitising handsamples

```{admonition} Lecture
<iframe width="600" height="450" src="https://www.youtube-nocookie.com/embed/O6R1EEOrM4A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

Successful digitisation of small hand samples requires even better imaging routines.
In a nutshell,

1. the target should cover the full frame of the image,
2. with the entirety of the target kept in focus.

### Focus & aperture

Given the proximity to smaller handsamples (centimetres versus (deca)metre scale for outcrops), the in-focus depth range of the image is important.
Optimally, the entire object should be in focus, to enable accurate correlation of the entire object across multiple images, thereby increasing the final quality of the models.

The impact of changing a camera's aperture value on the focus/sharpness throughout the acquired image is shown in {numref}`povray_focal_blur_animation`.

```{figure} https://upload.wikimedia.org/wikipedia/commons/c/c3/Povray_focal_blur_animation.gif
:name: povray_focal_blur_animation

A computer animation showing the effect of how aperture change affects the focus area of the image  {cite}`sharkdEnglishComputerAnimation2016`.
```

The largest in-focus field of depth therefore corresponds with the smallest aperture size (or largest f-number).
This is something we should thus aim for when configuring our cameras.

As seen in {numref}`aperture_diagram`, decreasing the aperture coincides with a reduction in light, and therefore requires either longer exposure times or a brighter imaging location.

```{figure} https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Aperture_diagram.svg/1920px-Aperture_diagram.svg.png
:name: aperture_diagram

Aperture sizes and related f-numbers. Going left to right, each circle is about a factor two smaller than the previous  {cite}`en.wikipediaSVGImageShowing2006`.
```

### A tripod, exposure settings and colour diagrams

Longer exposure times in a bright environment have the risk of several things, most notably introducing blur by moving the camera, overexposing the targets, and/or bleaching the colours.

First and foremost, image acquisition of handsamples should always use a tripod.
Only a tripod keeps the camera exactly in place while taking an image, therefore preventing any blurring.
For the same reason, a remote trigger is preferable.

When it comes to lighting, the object should be lit uniformly from all sides to prevent shadows and texture-colour change as a result of the lighting.
Further, knowing the temperature of the light allows one to specify the light temperature as an acquisition parameter, which should compensate the colour adjustment in the final photos and result in *True Colours*.


```{admonition} True Colours
:class: tip

Capture a colour card in the background of your sample to adjust the colour balance as part of post processing.
This works exceptionally well when coupled with *raw* imaging and can be used in conjunction with the light temperature parameter.
```

### Haloes, arches and photo rings

A good camera setup further contributes to consistency in the capturing process.
Ideally, the sample should be imaged with sufficient overlap between images.
Each of the haloes or photo rings in {numref}`photo_halo` represents this, with equal distances between the images in each ring.

```{figure} assets/photo_halo.png
:name: photo_halo

Haloes around the sample (centre point).
Each halo comprises all the photos taken of the sample in a specific orientation, meaning the sample shown has been imaged in four distinct positions.
Within a halo each image should be equally spaced; if not, something has possibly gone wrong either during acquisition (or photo alignment), and needs checking.
```

{numref}`photo_halo` has four rings in total, which means the sample has been imaged on four sides.
Digitisation usually only succeeds when the sample is imaged in three distinct orientations, usually in top-down, down-top orientation, and a side-ways orientation that provides overlap between top-down and down-top orientations.
Each additional orientation increases the confidence and success rate of the final digitisation.

```{admonition} Scaled models
:class: tip

By including ground control points (GCPs) in a single orientation (as per the [GCP exercise](../l2/exercise2 "")), you can easily *georeference* the samples to their real-world scale.
However, make sure to only do so for *one (1)* orientation, as GCPs are considered absolute reference points during processing and take precedence in aligning (or misaligning) your images!
```
