FROM ubuntu:20.10

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl 

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update && apt-get install -y kubectl && apt-mark hold kubectl

#RUN mkdir -p /root/.kube/

#ADD ./config / /root/.kube/

ENTRYPOINT [ "kubectl" ]