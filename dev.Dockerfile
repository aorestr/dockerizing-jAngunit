###################
### Angular app ###
###################
# base image
FROM node:12.18.0
LABEL author="Ángel Oreste"
EXPOSE 4270

# clone repo with the app
WORKDIR /app
RUN git clone https://github.com/aorestr/jAngunit

# set working directory
WORKDIR /app/jAngunit

# install all the needed packages for Angular
RUN npm install

# start app
CMD npm start