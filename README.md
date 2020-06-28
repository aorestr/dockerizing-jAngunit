# dockerizing-jAngunit
Let's build up my [jAngunit Angular app](https://github.com/aorestr/jAngunit) production version using Docker. Everything here has only be tested on _Elementary OS 5.1.5 Hera_ (based on _Ubuntu 18.04_)

## Docker

### Docker installation
I followed [this official guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) to install the **Docker Engine**. I'm using **Docker** 19.03.11. If you don't want to run **Docker** as sudo, follow [this guide](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).

### Build and run the app on the production container
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

## KubectlKubernetes

We can use use **Kubernetes** for orchestating our container.

### Kubernetes installation
I gather here all the necessary step to make **Kubernetes** work in a OS like mine. You will need not only Kubectl but also **Minikube** to make things work on a local environment.
```
# Install Kubectl
sudo apt update && sudo apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install -y kubectl
# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.11.0-0_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```
Run `minikube start` and you are ready to go.

### Deploy application using Kubernetes
Since no image of the app has been pulled, we will need to use our own local **Docker** images. In order to do that, we have to build the Docker image using the **Minikube** Docker environment. Do the following then:
```
eval $(minikube docker-env)
docker build -t jangunit-app:prod -f Dockerfile .
```
So we now have an image to be used by **Kubernetes**. Now run the pod through the already existing manifest:
```
kubectl apply -f jangunit-app.yaml
```
We are using _Minikube_, so no external IP will be actually deploy. We can expose one though thanks to the `minikube tunnel` command. Run it on a separate terminal.

Now run `kubectl get services` and you will see the load balancer service we have created. It has an external IP related. Copy it and then paste it on your browser. Voilà. The Angular application will be right before your eyes.