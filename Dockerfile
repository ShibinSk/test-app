FROM node:21-alpine3.17
# RUN npm install pm2 -g

WORKDIR /app

EXPOSE 80

COPY dist/* dist/
COPY fonts/* fonts/

RUN mkdir /app/logs

# ENTRYPOINT ["sh", "-c", "node dist/server.js | tee -a /app/logs/server.log"]
CMD [ "node", "dist/server.js" ]