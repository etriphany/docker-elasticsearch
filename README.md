## Description

Docker images for:
* [Elasticsearch](https://www.elastic.co/products/elasticsearch) based on slim **Alpine Linux**.
* [Kibana](https://www.elastic.co/products/kibana) based on **Ubuntu 16.04**.

## Main Components

* Java 8 (openjdk)
* Elasticsearch 6.x
* Kibana 6.x

## Differences from Official Elastic Image

This Elasticsearch image is based on :whale: image [java:openjdk-8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile), which makes
it relatively smaller compared with official Elastic image based on **CentOS 7**:

 Elastic Image                                                              | Etriphany Image
----------------------------------------------------------------------------|-------------------------------------
Based on **CentOS 7**                                                       | Based on **Alpine 3.5**
Image size around **510 MB**                                                | Image size around **150 MB**

## Building the Images

```
$ git clone https://github.com/etriphany/docker-elasticsearch.git
$ cd docker-elasticsearch
$ docker-compose build
```

## Usage Examples

Running a container:

```
$ docker run -d -p 9200:9200 etriphany/elasticsearch-6
```

Running a container defining Elasticsearch settings from command line:

```
$ docker run -d -p 9200:9200 -e "http.host=0.0.0.0" -e "cluster.name=my_cluster" etriphany/elasticsearch-6
```

Running full test cluster, including a Kibana node, using Docker Compose:

```
$ docker-compose up -d
```

Access your local Kibana instance at:
```
http://localhost:5601
```
