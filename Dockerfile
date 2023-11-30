# A dockerfile must always start by importing the base image.
# We use the keyword 'FROM' to do that.
FROM golang:1.19-alpine
#Setup the Enviornment variables 
#pass these with the -e command when running the Docker

ENV serverurl=serverurl
ENV token=token
ENV client=client
ENV username=username
ENV acmeemail=acmeemail

#make the boringproxy working folder
RUN mkdir /boringproxy
#make the certs folder
RUN mkdir /boringproxy/certs
RUN wget https://github.com/boringproxy/boringproxy/releases/latest/download/boringproxy-linux-x86_64

# Make executable
RUN chmod +x boringproxy-linux-x86_64
#Move it to the boringproxy workign folder
RUN mv boringproxy-linux-x86_64 /boringproxy



ENTRYPOINT /boringproxy/boringproxy-linux-x86_64 client -server ${serverurl} -token ${token} -client-name ${client} -user ${username} -acme-email ${acmeemail} -cert-dir /boringproxy/certs
