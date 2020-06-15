# base image
FROM node:12.18.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# copy the jAngunit repo to workplace
RUN sh -c 'apt-get update; apt-get install -y git; \
    git clone git@github.com:aorestr/jAngunit.git'

# install all the needed packages for Angular
RUN sh -c 'curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - sudo apt-get install -y nodejs \
    npm install npm@latest -g \
    npm install'

# start app
CMD npm start