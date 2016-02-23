[![MIT License](https://img.shields.io/badge/licsense-MIT-orange.svg)](https://github.com/rtcTo/rtc2git-docker/blob/master/LICENSE)

# rtc2git-docker
Builds a docker image containing the [RTC](https://jazz.net/products/rational-team-concert/) SCM repository into a Git repository migration environment.

## Build requirements
In order to build correctly you need to download the **[Linux 64 SCM Tools 5.0.1](https://jazz.net/downloads/rational-team-concert/releases/5.0.1?p=allDownloads)** and store it in the base directory as *RTC-scmTools-Linux64-5.0.1.zip*. Also you need to get the latest version of the **[rtc2gitcli](https://github.com/rtcTo/rtc2gitcli)** plugin JAR file. This has to be placed into the *plugins/* directory. 

## Building using a proxy server
To build the image when having to use a proxy use the docker build argument 
as follows (requires docker 1.9+):

```
docker build --build-arg="http_proxy=http://someproxy.somedomain:1234" --build-arg="VERSION=5.0.1" .
```

## Running the docker image
You can run the docker image with the following command if your local data volume should point to */var/rtc2git* as follows:

```
docker run -v /var/rtc2git:/var/data -it --name rtc2git rtcto/rtc2git
```

And to restart the image do execute the following command:

```
docker start -i rtc2git
```


## Migration process
A simple migration can be done now, after doing simple preparation steps:

- Create a source RTC workspace refered by *SOURCE_WORKSPACE*
- Create a target RTC workspace refered by *TARGET_WORKSPACE*
- Create a optional migration.properties file in the target volume root

For more information see the plugin [documentation](https://github.com/rtcTo/rtc2gitcli/blob/master/README.md)

Load initial *TARGET_WORKSPACE* content:
```
scm load -r <scm-url> -u <user> -P <password> TARGET_WORKSPACE
```

Start the migration:
```
scm migrate-to-git -r <scm-url> -u <user> -P <password> -m /var/data/migration.properties SOURCE_WORKSPACE TARGET_WORKSPACE
```

### Note if SELinux enabled systems
If you running on a SELinux enabled system you may need to flag your working directory used as volume mount point to be accessible:

```
chcon -Rt svirt_sandbox_file_t /var/rtc2git
```

### Enable remote debug the SCM tools

If you need to copy additional files and remote debug over port *8000* you should initially run docker with the following command:

```
docker run -v /var/rtc2git:/var/data -p 8000:8000 -it --name rtc2git rtcto/rtc2git
```

Also add the following lines to the */opt/jazz/scmtools/eclipse/scm.ini* within the running docker instance (Just install your favorite
editor using *apt-get*):

```
-Xdebug
-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000
```
