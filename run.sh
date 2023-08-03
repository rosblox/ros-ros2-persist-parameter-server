docker run -it --rm --name=ros-ros2-persist-parameter-server \
--volume $(pwd)/ros2_persist_parameter_server:/colcon_ws/src/ros2_persist_parameter_server \
--volume $(pwd)/ros2_persist_parameter_server/server/param/parameter_server.yaml:/tmp/parameter_server.yaml \
--ipc=host --pid=host \
--network=host \
--env UID=$(id -u) \
--env GID=$(id -g) \
ghcr.io/rosblox/ros-ros2-persist-parameter-server:humble
