# dockerizing-jAngunit
Let's build up my [jAngunit Angular app](https://github.com/aorestr/jAngunit) production version using Docker

## Docker installation
I followed [this official guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) to install the Docker Engine on my _Elementary OS 5.1.5 Hera_ (based on _Ubuntu 18.04_). I'm using Docker 19.03.11. If you don't want to run Docker as sudo, follow [this guide](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).

## Build and run the app
I've created a Dockerfile that builds a Nginx server. The container downloads the latest updates of the repo directly from GitHub. Since it's just an example, I haven't applied any custom configuration for Nginx.

In order to build the production image run:
```
docker build -t jangunit-app:prod -f Dockerfile .
```
And to run it:
```
docker run --rm -ti -p 4270:80 --name=jangunit-container jangunit-app:prod
```
Your app will be available at "http://localhost:4270/".