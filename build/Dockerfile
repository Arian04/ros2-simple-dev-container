# syntax = docker/dockerfile:1

# image args
ARG BASE_IMAGE=ros
ARG BASE_IMAGE_TAG=jazzy

# used for package names. coincidentally the same as BASE_IMAGE_TAG, but may not always be, so
# this is a different var just in case.
ARG ROS_CODENAME=jazzy

# username of user in the container
ARG CONTAINER_USER="ubuntu"

##### Create customized image #####
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}

ARG ROS_CODENAME
ARG CONTAINER_USER

# Just installing some packages early so they're available later without explicit installation
#
# NOTE:
# `--mount-type` and `rm ... docker-clean` is for caching package installations between multiple builds.
# deleting that docker-clean conf file is also probably beneficial for the intended (interactive) usage of this image.
# Source: https://vsupalov.com/buildkit-cache-mount-dockerfile/
#
# also, I'm intentionally NOT removing /var/lib/apt/lists/* because this will be built
# locally right before being used (also locally), so keeping those could be convenient for the user.
RUN rm -f /etc/apt/apt.conf.d/docker-clean
RUN --mount=type=cache,target=/var/cache/apt \
	apt-get update && \
	apt-get install -y \
	ros-${ROS_CODENAME}-rviz2 \
	ros-${ROS_CODENAME}-rqt

# Add current user as a sudoer
RUN usermod -aG sudo "${CONTAINER_USER}"
