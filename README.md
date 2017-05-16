## Description

Docker image packaging for Elasticsearch based on slim **Alpine Linux**.

This image is based on [java:openjdk-8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile)

## Main Components

* Java 8 (openjdk)
* Elasticsearch 5.4.0

## Diferences from Official Elastic Image

 Elastic Image                                                              | Etriphany Image
----------------------------------------------------------------------------|-------------------------------------
Based on **CentOS 7**                                                       | Based on **Alpine 3.5**
Image size around **510 MB**                                                | Image size around **150 MB**
Besides interal configurations, can handle env parameters from _docker run_ | Deals only with intenal configurations
Provides _docker composer_ support                                          | Not supported (to do) 
