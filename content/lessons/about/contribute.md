(contribute)=
# How to contribute

```{figure} ../../../assets/github_tut.gif
:name: github_tut2

This page uses [Github](https://youtu.be/w3jLJU7DT5E) as a backbone.
All it takes is a [Github account](https://github.com/join), which even comes with student benefits.
Once connected, feel free to open an issue as per the above - whether suggesting improvements or highlighting bugs.
```

```{admonition} GitHub how-to's and tutorial
:class: seealso
GitHub has an extensive documentation available in its [GitHub Docs pages](https://docs.github.com/en/get-started/quickstart), the here-provided information is here to get you started with the basics.
```

First things first: to contribute, you will need a GitHub account.
All it takes is a visit to the [signup page](https://github.com/join).
You can even link your personal account with your UNIS email address, giving you additional student benefits.

Once done, you can suggest issues to this module and others by clicking *Open Issue*, which allows you to open a discussion/ticket in which you can describe what is wrong, provide suggestions, or point out bugs.
Alternatively, you can directly suggest changes to the code/text underlying the Geo-SfM module.
This is typically done by creating a fork (or split), making changes, and then merging the fork with the main branch again.
In addition for allowing another person to review your changes, it also adds your nametag to the change - and provides you with some ownership of the (changed) content.

## Creating a fork

There are several ways in which you can make a fork, as outlined in the [GitHub Docs pages](https://docs.github.com/en/get-started/quickstart).
Here, we will use the simplest way to get going, namely, by simply following {numref}`github_tut` and clicking *Suggest edit*.
This will automatically make a fork (or copy) of the repository into your own GitHub account, which you can then revise and edit independently from the source ({numref}`github-limited-rights-fork`).

```{figure} assets/github-limited-rights-fork.png
:name: github-limited-rights-fork

As seen here, the user PeterBetlem does not have write access to the jupyter-book repository.
As a result, suggesting changes resulted in the creation of a new branch in the fork PeterBetlem/jupyter-book (which is accessible in your Repositories Tab in your account).
```

Once you are done with your changes, make sure to *Commit changes* with a clear message to contribute to your own branch/the fork.
Unless you immediate propose changes back to the original branch/repository, your fork will eventually fall behind the original branch.
Thus, there is a need to update/sync your fork with the original from time to time.
As a rule of thumb, you would like to do this before making any significant changes.
A detailed guide on how to sync your fork through the web interface is provided [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork).

## Creating a pull request

```{figure} assets/github-fork-request.png
:name: github-fork-request

Webinterface of the forked branch, showing both the *Sync fork* option as well as the *Contribute* option.
```

Once all desired changes have been made, you may proceed with a pull request.
This is done by clicking the *Contribute* button as illustrated in {numref}`github-fork-request`, and then following along with the different prompts.
Make sure to provide a title and description of what your changes entail, and then click the *Create Pull Request* to forward your changes back to the original repository.

If all went well, your suggestions will be approved shortly - and you can celebrate a job well done! Thank you for contributing.


