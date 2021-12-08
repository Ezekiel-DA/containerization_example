# Define a base image to start from; these images are themselves defined by Dockerfiles, generally.
# In this specific case, the Dockerfile for the anaconda3 image is at: https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/debian/Dockerfile
FROM continuumio/anaconda3

# Set a working directory for all future commands, for convenience
WORKDIR /app

# Execute commands from a shell (while BUILDING the container; this is NOT executed when the container is run)
# Here, we're cloning an existing repo, and letting Anaconda do the heavy lifting of installing the dependencies for this project
#
# Note that this is ONLY done at build time; if you're getting this image already built from a Container Registry, this code never
# actually runs on your machine.
# 
# In a real scenario, it would be wise to have these steps produce a reproducible image; this likely means checking out a known stable version or tag,
# or maybe hosting a stable copy of the code along with this Dockerfile, etc.
RUN git clone https://github.com/gordicaleksa/pytorch-deepdream ./
RUN conda env create

# Copy files from the host into the container; this could be code to run, scripts, static data, etc.
# Just like RUN, this is only executed at container build time.
COPY start_jupyter.sh ./scripts/

# define ports that the container uses; when running the container, you may want to map these ports to ports on your host
EXPOSE 8888

# Define what command should run when the container starts; this is NOT executed at build time, but is the first thing the container does when spawned
# Here, we're simply running a basic wrapper script that will set up our Anaconda environment and start Jupyter Notebook
CMD ["/app/scripts/start_jupyter.sh"]
