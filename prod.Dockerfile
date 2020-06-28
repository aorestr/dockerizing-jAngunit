###############
### Builder ###
###############
# base image
FROM node:12.18.0 as builder

# set working directory
WORKDIR /app

# copy the jAngunit repo to workplace
RUN git clone https://github.com/aorestr/jAngunit.git
WORKDIR /app/jAngunit

# install all the needed packages for Angular
RUN npm install
RUN npm install -g @angular/cli@8

# generate build
RUN ng build --output-path=/app/dist

####################
### Nginx server ###
####################
# base image
FROM nginx:1.18.0-alpine
LABEL author="Ángel Oreste" 

# copy artifact build from the 'build environment'
COPY --from=builder /app/dist /usr/share/nginx/html

# expose port 80
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]