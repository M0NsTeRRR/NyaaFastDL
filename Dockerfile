FROM node:12.7-alpine as build

LABEL maintainer="Ludovic Ortega mastership@hotmail.fr"

# update package
RUN apk update

# copy program
COPY * /app/NyaaFastDL/

# remove useless file
RUN rm /app/NyaaFastDL/Dockerfile

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