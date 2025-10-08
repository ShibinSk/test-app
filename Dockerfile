FROM node:21-alpine3.17

WORKDIR /app

# Set the port your app listens to
EXPOSE 80

# Copy built code
COPY dist/ dist/
COPY fonts/ fonts/

# Create log folder
RUN mkdir -p /app/logs

# Stream logs to stdout so docker logs shows output
ENTRYPOINT ["sh", "-c", "node dist/server.js | tee -a /app/logs/server.log"]
