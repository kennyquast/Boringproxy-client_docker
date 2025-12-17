FROM alpine:latest
LABEL boringproxy.version="0.10.0"
LABEL maintainer="slayer1011"

#Setup the Enviornment variables 
#pass these with the -e command when running the Docker

ENV serverurl=serverurl
ENV token=token
ENV client=client
ENV username=username
ENV acmeemail=acmeemail

#make the boringproxy working folders
RUN mkdir -p /boringproxy/certs

# Download latest version
RUN wget -q https://github.com/boringproxy/boringproxy/releases/latest/download/boringproxy-linux-x86_64 \
 && chmod +x boringproxy-linux-x86_64 \
 && mv boringproxy-linux-x86_64 /boringproxy/

# Run boringproxy client with the environment variables
ENTRYPOINT /boringproxy/boringproxy-linux-x86_64 client \
  -server ${serverurl} \
  -token ${token} \
  -client-name ${client} \
  -user ${username} \
  -acme-email ${acmeemail} \
  -cert-dir /boringproxy/certs
