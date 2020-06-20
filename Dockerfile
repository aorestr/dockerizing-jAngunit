# base image
FROM node:12.18.0
EXPOSE 4270

LABEL author="Ángel Oreste" 

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# copy the jAngunit repo to workplace
RUN git clone https://github.com/aorestr/jAngunit.git
WORKDIR /app/jAngunit

# install all the needed packages for Angular
RUN npm install -g npm@6.14.5
RUN npm install

# start app
CMD npm start