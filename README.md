# A simple example of containerizing existing code

This is a basic example of containerizing gordicaleksa/pytorch-deepdream.

See the `Dockerfile` for more information on how the image is produced.

# How to run the containerized app

First: [install Docker Desktop](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe) (or some other container runtime), if you don't already have it

Then, from a command line:
```
docker run deepdream_demo
```

# How to rebuild this container image
Clone this repo, then:

```
docker build . -t <a_name_of_your_choice_for_the_image>