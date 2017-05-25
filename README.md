## Description

Docker image packaging for [Elasticsearch](https://www.elastic.co/products/elasticsearch) based on slim **Alpine Linux**.

This image is based on :whale: image [java:openjdk-8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile).

## Main Components

* Java 8 (openjdk)
* Elasticsearch 5.4.0

## Differences from Official Elastic Image

 Elastic Image                                                              | Etriphany Image
----------------------------------------------------------------------------|-------------------------------------
Based on **CentOS 7**                                                       | Based on **Alpine 3.5**
Image size around **510 MB**                                                | Image size around **150 MB**


## Usage Examples

Building the image:

```
$ git clone https://github.com/etriphany/docker-elasticsearch.git
$ cd docker-elasticsearch
$ docker build . -t etriphany:elasticsearch
```

Running a container:

```
$ docker run -d -p 9200:9200 etriphany:elasticsearch
```

Running a container defining Elasticsearch settings from command line:

```
$ docker run -d -p 9200:9200 -e "http.host=0.0.0.0" -e "cluster.name=my_cluster" etriphany:elasticsearch
```

Running a test cluster using docker compose:

```
$ docker-compose up
```
