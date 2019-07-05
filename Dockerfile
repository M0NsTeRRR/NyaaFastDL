FROM node:12.6-alpine as build

MAINTAINER Ludovic Ortega mastership@hotmail.fr

# update package
RUN apk update

# install git
RUN apk add git

# download website project
RUN git clone https://github.com/M0NsTeRRR/NyaaFastDL

# copy file to /app/
RUN mkdir -p /app/NyaaFastDL/ && mv NyaaFastDL/* /app/NyaaFastDL/

# remove useless file
RUN rm -Rf ./NyaaFastDL /app/NyaaFastDL/Dockerfile

# set workdir
WORKDIR /app/NyaaFastDL/

# install dependencies
RUN npm install

# build frontend
RUN npm run-script build

# create static directory
RUN mkdir -p /opt/services/NyaaFastDL/static/

# copy dist files in static directory
RUN mv ./dist/* /opt/services/NyaaFastDL/static/