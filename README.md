# Docker_demo

//Live555 pulls stream in Docker Image

- docker build -t rtsp:1.0 .
- docker run --name rtsp --rm rtsp:1.0 /bin/bash

//另起一个终端
- docker exec -it rtsp /bin/bash
