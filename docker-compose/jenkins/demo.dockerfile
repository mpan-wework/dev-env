FROM node:14.16.0-alpine3.13
ARG GIT_COMMIT
ARG NODE_ENV=development
RUN GIT_COMMIT=${GIT_COMMIT} NODE_ENV=${NODE_ENV} node -e 'console.log(process.env.GIT_COMMIT, process.env.NODE_ENV)'
