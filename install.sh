#!/usr/bin/env bash

docker run -d --name jenkins -p 80:8080 -p 50000:50000 \
  --restart=unless-stopped \
  -v /home/jenkins:/home/jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e JENKINS_URL=${url} \
  -e JENKINS_USER=${user} \
  -e JENKINS_PASS=${password} \
  foxylion/jenkins
