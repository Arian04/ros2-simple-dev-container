# Make sure $USER is properly set in your user shell, and that $UID and $GID aren't set to root's values when you `sudo` a command

source ./.env

mkdir -p "./${CONTAINER_ROOT_DATA_DIR:?}"/{home,root,etc,log,usr,var}
mkdir -p ./data

xhost +SI:localuser:$USER # allows your current local user to connect to the X server

# runs the container (building if needed). deletes container on exit and starts it with interactive TTY
sudo docker compose run --build --rm -it ros2
