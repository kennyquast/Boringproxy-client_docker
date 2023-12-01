# Boringproxy-client_docker
_Boring Proxy Client as a docker (including being implemented in Unraid)_

**prerequisite:** You need the BoringProxy serverside already setup somewhere (usually on a public IP facing VPS somewhere)

-----------------------------

The Dockerfile will create a docker for you.
You can get boringproxy from the official repository (https://github.com/boringproxy/boringproxy/releases)

# Building the Docker
The following will get up and running (replacing <VARIABLE> with the correct info for your server)

Place the Dockerfile somewhere locally and run the following from within the Dockerfile directory

```docker build --label boringproxy_client -t boringproxy-client .```

# Running the Docker
_note: you get all this information from your server side admin panel_

```
docker run -d \
--name boringproxy_client \
--mount type=bind,source=<PATH TO LOCAL FOLDER>,target=/boringproxy/certs \
-e serverurl=<SERVER URL> \
-e token=<TOKEN> \
-e client=<CLIENT NAME> \
-e username=<USERNAME> \
-e acmeemail=<EMAIL> \
boringproxy-client
```

Below is an example with fields filled out (this is not a real token)
```
docker run -d \
--name boringproxy_client \
--mount type=bind,source=/home/username/boringproxy/certs,target=/boringproxy/certs \
-e serverurl=boringproxy.example.com \
-e token=90sdfUIH9kj098GJG67ghjGKlk \
-e client=Boring_Docker \
-e username=admin \
-e acmeemail=email@example.com> \
boringproxy-client
```


Now goto your Boringproxy Server Admin panel and add tunnels as normal (using your \<CLIENT NAME\> as your client)

# Building the Docker from Dockerhub

Run the following command to pull my image from Docker Hub

```docker pull slayer1011/boringproxy-client:latest```


# Running the Docker
_note: you get all this information from your server side admin panel_ 

_It's all the same as above with the exception of the docker name includes the repo_

```
docker run -d \
--name boringproxy-client \
--mount type=bind,source=<PATH TO LOCAL FOLDER>,target=/boringproxy/certs \
-e serverurl=<SERVER URL> \
-e token=<TOKEN> \
-e client=<CLIENT NAME> \
-e username=<USERNAME> \
-e acmeemail=<EMAIL> \
slayer1011/boringproxy-client:latest
```

Now goto your Boringproxy Server Admin panel and add tunnels as normal (using your \<CLIENT NAME\> as your client)

# Using the Docker within Unraid

*At this time I do not have the spare time to submit this docker to be included in the Community Apps as I don't think I will have the time to fully support it through the official support forums.*

However, I have included a file that you can include in your Unraid USB to be able to install this and manage it from your Web UI just as you would any other application (including automatically updating along side your other Dockers)

```
my-Boringproxy-client.xml
```
Place this file in the boot USB folder located at the following
```
/config/plugins/dockerMan/templates-user
```
once the file is there with your other docker templates you can click ADD CONTAINER from your Web UI and choose ```Boringproxy-client``` from the templates dropdown and fill in the fields accordingly.

Now goto your Boringproxy Server Admin panel and add tunnels as normal (using your \<CLIENT NAME\> as your client)

\
\
\
_One thing to note, whenever *my* Boringproxy-client repo on Docker Hub is Updated, it will send your unraid a notice that an update is required._

IF you would like to control the docker hub image yourself, I suggest creating your own docker and pushing it to your own Docker hub. In this case, you need to modify the repo field in the XML to point to YOUR docker hub repo.

