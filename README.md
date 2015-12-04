# Docker image containing the RTC to GIT migration environment

## Building using proxy
To build the image when having to use a proxy use the docker build argument 
as follows:

````
docker build --build-arg="http_proxy=http://proxy-noauth.infra.local:8080" .
````


## Running the docker image