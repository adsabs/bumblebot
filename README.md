# bumblebot

ErrBot for the ADS

## Running BumbleBot
Create the Docker image

```
docker build -t adsabs/bumblebot:<version> .
```
and then start the Docker container
```
docker -d run --name bumblebot -v <host data directory>:/data/ -v PATH_TO_HOST_PLUGINS:/opt/errbot/plugins -e SLACK_BOT_TOKEN=<TOKEN> adsabs/bumblebot:<version>
```
