[![MIT License](https://img.shields.io/badge/licsense-MIT-orange.svg)](https://github.com/rtcTo/rtc2git-docker/blob/develop/LICENSE)

# rtc2git-docker
Builds a docker image containing the [RTC] (https://jazz.net/products/rational-team-concert/) SCM repository into a Git repository migration environment.

## Building using proxy
To build the image when having to use a proxy use the docker build argument 
as follows:

````
docker build --build-arg="http_proxy=http://proxy-noauth.infra.local:8080" .
````


## Running the docker image