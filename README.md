### Run ROS2 in a Docker container (persistently and with graphical application support)

The expected workflow is pretty much as if you had a VM running ROS2, but without the larger resource usage of
a VM over a container.

---
### Usage

1. Clone this repo into some directory

2. Run the `run.sh` script as your normal user. It will do the necessary initialization steps and then
drop you into a shell afterwards.
- Do NOT run with `sudo`, since it uses the current user to set access control properly with `xhost`.
- It will run the docker command with `sudo` if necessary, but if that logic is wrong for any reason, then 
you can easily edit it to hardcode whether or not to use `sudo` for your situation.

3. Work in the container :)

##### Directory structure

Directories for YOUR data:
- `container` - stores the container's root filesystem contents. This is how it can be persistent between runs.
- `data` - A directory that has been included as a way for a user to share some misc data between the host
and the container. This is unecessary, as you could just use the container's `/home/$USER` directory, but it's
included for convenience. You could remove it if you want.

Other stuff:
- `./build` - directory for Dockerfile and any required build context. Feel free to edit this if you want to change anything.
- `.env` - Stores some env vars that are shared between the `docker-compose.yml` file and the run script.
- `./run.sh` - run script
