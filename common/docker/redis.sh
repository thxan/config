#!/bin/bash
docker run -d --name redis-default -p 6379:6379 redis --requirepass "mypassword"
