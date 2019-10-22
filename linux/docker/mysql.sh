#!/bin/bash
docker run --name mysql-default -p 33006:3306 -e MYSQL\_ROOT\_PASSWORD=root  -d mysql