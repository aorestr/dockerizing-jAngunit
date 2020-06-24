# base image
FROM node:12.18.0
EXPOSE 4270

LABEL author="Ángel Oreste" 

# set working directory
WORKDIR /app

# copy the jAngunit repo to workplace
RUN git clone https://github.com/aorestr/jAngunit.git
WORKDIR /app/jAngunit

# install all the needed packages for Angular
RUN npm install

# start app
CMD npm start