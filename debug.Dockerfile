FROM node:15.8-buster-slim

WORKDIR /home/node

RUN chown -R node /home/node

COPY ["package.json", "package-lock.json", "./"]

RUN npm install --silent --no-update-notifier --unsafe-perm=true --allow-root

USER node

CMD ["npm", "start"]
