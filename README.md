# BoringProxyDocker-Unraid
Boring Proxy Client as a docker (Eventually to be fully implemented in Unraid)

prerequisite: You need the BoringProxy serverside already setup somewhere (usually on a public IP facing VPS somewhere)

prerequisite: You Need the current version of BoringProxy (https://github.com/boringproxy/boringproxy/releases) in the same folder as the Dockerfile
-----------------------------

The Dockerfile will crate a docker for you. It however requires you to have the latest version of Boringproxy in the same folder
you can get boringproxy from the official repository (https://github.com/boringproxy/boringproxy/releases)

Once you have these files in the same folder you can build and run the docker

run the following to get up and running

docker build -t boring_proxy_docker .
docker run --name BoringProxy-Client boring_proxy_docker

this will now be running on your client side
however you will be stuck with it running in your terminal. 
press CTRL + C to stop it

now go over to your Unraid dashboard and you should have the docker listed in your Docker Tab.
You can start/Stop and Autostart from here now
Also the logs are useful to check otu if you need to see what the server/client are doing


Now goto your Boringproxy Server Admin panel and add tunnels as normal (using your {UNIQUE_NAME} as your client)


Future: 
I'll work on cleaning this up to utilize Unraids templatign system, and get it added to the Community Apps

for now, this works and i can access my server through CGNAT again


