# Boringproxy-client_docker
_Boring Proxy Client as a docker (Eventually to be fully implemented in Unraid)_

**prerequisite:** You need the BoringProxy serverside already setup somewhere (usually on a public IP facing VPS somewhere)

-----------------------------

The Dockerfile will create a docker for you.
You can get boringproxy from the official repository (https://github.com/boringproxy/boringproxy/releases)

run the following to get up and running (replacing <VARIABLE> with the correct info for your server)

# Building the Docker

```docker build --label boringproxy_client -t boringproxy-client .```

# Running the Docker
_note: you get all this information from your server side admin panel_

```docker run -d \
--name boringproxy_client \
--mount type=bind,source=<PATH TO LOCAL FOLDER>,target=/boringproxy/certs \
-e serverurl=<SERVER URL> \
-e token=<TOKEN> \
-e client=<CLIENT NAME> \
-e username=<USERNAME> \
-e acmeemail=<EMAIL> \
boringproxy-client
```

Below is an example with fields filled out
```docker run -d \
--name boringproxy_client \
--mount type=bind,source=/home/username/boringproxy/certs,target=/boringproxy/certs \
-e serverurl=boringproxy.example.com \
-e token=90sdfUIH9kj098GJG67ghjGKlk \
-e client=Boring_Docker \
-e username=admin \
-e acmeemail=email@example.com> \
boringproxy-client
```


Now goto your Boringproxy Server Admin panel and add tunnels as normal (using your <CLIENT NAME> as your client)


Future: 
I'll work on cleaning this up to utilize Unraids templating system, and get it added to the Community Apps


Add : Docker.com repo ninstructions
