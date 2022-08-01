FROM node:16

# Create src directory
WORKDIR /src

RUN npm install http-server -g

# Bundle app source
COPY ./src .

EXPOSE 8080
