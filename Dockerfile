## if you use this file you MUST edit the placeholder variables to point to your server

# A dockerfile must always start by importing the base image.
# We use the keyword 'FROM' to do that.
FROM golang:1.19-alpine


COPY boringproxy-linux-x86_64 /boringproxy/
RUN chmod +x /boringproxy/boringproxy-linux-x86_64

# We need to define the command to launch when we are going to run the image.
# We use the keyword 'CMD' to do that.
# The following command will execute "python ./main.py".
CMD [ "/boringproxy/boringproxy-linux-x86_64", "client", "--server", "{SERVER_URL}", "-token", "{TOKEN}", "-client-name", "{UNIQUE_NAME}", "-user", "{SERVER_USERNAME}", "-acme-email", "{YOUR_EMAIL}" ]
#{SERVER_URL}, {TOKEN}, {SERVER_USERNAME} are all available in your server side panel
#{UNIQUE_NAME} can be anythign you want
#{YOUR_EMAIL} is whatever email to attach to your CA SSL incase of errors.

