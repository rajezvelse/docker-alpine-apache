## Alpine container with Apache

This is a mini docker container based on Alpine OS and Apache version 2.4.

This image is build using [alpine](https://hub.docker.com/r/_/alpine/) offical image as base image and installing Apache component. No other modifications maded, no more component were added.

To view build process check the [Dockerfile](https://github.com/rajezvelse/docker-alpine-apache/Dockerfile).

#### Starting the container as a daemon

	docker run -d --name apache rajez/alpine-apache

#### Accessing apache from outside the container

To access the webserver from external you can the **-P/-p** paramter, with **-P** the ports 80 and 443 is automaticly exposed and assign a random port.

or use the **-p** command to assign other ports, the syntax is

	-p <external port on host>:<local port in container>

so to access the apache server port 80 on port 8080 you should use the command

	docker run -d --name apache -p 8080:80 rajez/alpine-apache

#### Successsful setup

To check the successfull setup, open [http://localhost](http://localhost) in a webbrowser. If everything worked well, you will able to see the following page.

![screenshot](https://github.com/rajezvelse/docker-alpine-apache/blob/master/images/screenshot.png?raw=true "Screenshot")
