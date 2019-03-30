# base image to build our instance upon
FROM node:latest

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install --silent
RUN npm install --save webpack
RUN npm install react-scripts@1.1.1 -g --silent
RUN npm install @material-ui/core

# base of the Babel ecosystem, parses JS code,
# very powerful with the right plugins
RUN npm install --save babel-core

# allows Webpack to transpile JS code via Babel
RUN npm install --save babel-loader

# allows transpilation from latest ES2015+
# features to ES5
RUN npm install --save babel-preset-env

# and finally, JSX to ES5 transpilation
RUN npm install --save babel-preset-react

#RUN npm install --save webpack-cli

RUN npm install --save webpack-dev-server

# start app
CMD ["npm", "start"]
