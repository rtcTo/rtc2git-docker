[![MIT License](https://img.shields.io/badge/licsense-MIT-orange.svg)](https://github.com/rtcTo/rtc2git-docker/blob/master/LICENSE)

# rtc2git-docker
Builds a docker image containing the [RTC](https://jazz.net/products/rational-team-concert/) SCM repository into a Git repository migration environment.

## Building using proxy
To build the image when having to use a proxy use the docker build argument 
as follows (requires docker 1.9+):

````
docker build --build-arg="http_proxy=http://someproxy.somedomain:1234" .
````

## Running the docker image
You can run the docker image with the following command if your local data volume should point to */var/rtc2git* as follows:

````
docker run -v /var/rtc2git:/var/data -it --name rtc2git rtcto/rtc2git
````

And to restart the image do execute the following command:

````
docker start -i rtc2git
````
