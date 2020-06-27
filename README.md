# dockerizing-jAngunit
Let's build up my jAngunit Angular app using Docker

## Docker installation
I followed [this official guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) to install the Docker Engine on my _Elementary OS 5.1.5 Hera_ (based on _Ubuntu 18.04_). I'm using Docker 19.03.11. If you don't want to run Docker as sudo, follow [this guide](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).

## Build and run the app in dev mode
Once you are located on the repo folder, build the Docker image:
```
docker build -t angular-app:dev -f dev.Dockerfile .
```
And then run a container based on it:
```
docker run --rm -ti -p 4270:4270 --name angular-container angular-app:dev
```
You can access the Angular app just by typing "http://localhost:4270/" on your favourite browser.

## Build and run the app in prod mode
I've created a second Dockerfile that builds a Nginx server. Since it's just an example, I haven't applied any custom configuration for Nginx.

Again, in order to build the production image run:
```
docker build -t angular-app:prod -f prod.Dockerfile .
```
And to run it:
```
docker run --rm -ti -p 4270:80 --name=angular-container angular-app:prod
```
Your app will be available at "http://localhost:4270/".