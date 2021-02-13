FROM node:15.8-buster-slim

WORKDIR /bodhitree-web

COPY ["package.json", "package-lock.json", "./"]

RUN npm install --silent --no-update-notifier

RUN useradd bodhitree && chown -R bodhitree /bodhitree-web
USER bodhitree

CMD ["npm", "start"]
