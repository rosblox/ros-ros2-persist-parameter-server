FROM ros:humble-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-colcon-common-extensions \
    ros-humble-yaml-cpp-vendor \
    libyaml-cpp-dev libboost-program-options-dev libboost-filesystem-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh .

WORKDIR /colcon_ws
COPY ros2_persist_parameter_server src/ros2_persist_parameter_server

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install --event-handlers console_direct+

RUN echo 'alias build="colcon build --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'source /colcon_ws/install/setup.bash; ros2 run parameter_server server' >> /run.sh && chmod +x /run.sh
RUN echo 'alias run="su - ros /run.sh"' >> /etc/bash.bashrc
