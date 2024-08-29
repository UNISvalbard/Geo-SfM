# Sketchfab

[Sketchfab](https://sketchfab.com/) is a web-based platform for sharing and visualizing your 3D models online.

The platform offers users the ability to navigate freely within a 3D scene using mouse, touch manipulation, VR, or AR. You can view static 3D models such as DOMs and in some cases you can also play and control 3D animations.

## Publish your 3D model

If you want to make your DOM available online, you have two options:
- Uploading the Mesh and Texture files to Sketchfab and completing all the necessary information manually.
- Using the API code from your Agisoft Metashape account to do it automatically.

The first step for both options is to Create a profile on [Sketchfab](https://sketchfab.com/).

### From Sketchfab
1. In your Sketchfab profile, go to [_New upload_](https://sketchfab.com/signup?next=%2Ffeed%23upload).
2. Drag and drop your Mesh (.OBJ) and Texture (.JPG) files to the upload window.

```{figure} assets/manual_upload.png
:name: manual_upload

Upload a new model tab in Sketchfab.
```
3. Fill in all the information parameters related to the 3D model.
4. Publish it to make available online.

### Directly from Agisoft Metashape
1. In your Sketchfab profile, go to _Settings_ --> _Password & API_

```{figure} assets/settings.gif
:name: settings

Find the API key in your Sketchfab account.
```

2. Copy API token. This makes you able to upload 3D models from exporters & other applications directly to your Sketchfab account.
3. Go to your 3D model in Agisoft Metashape
4. Choose _File_ --> _Upload data_

```{figure} assets/publish_data.gif
:name: publish_data

Upload new model in Metashape GUI.
```

5. Choose Sketchfab and paste the API token into the API key field. Give your model a title and a short description. Press OK.
6. Your model should now appear in Sketchfab!

```{admonition} Quality of the 3D model
Although Sketchfab is limited by web constraints and cannot display the model's original quality, it is an excellent way to share and visualize your models online. Keep in mind that the original file is not overwritten.
```


## Publishing limitations

With the _basic plan_ on Sketchfab, the largest file size that can be uploaded is **200MB**.

```{figure} assets/limitations.png
:name: limitations

File size upload limitation for Sketchfab basic plan account.
```

In case your file size is larger than 200MB you have different options:
- Export the model with lower resolution.
- Upgrade to _premium account_, for which you will have to pay a monthly fee.

