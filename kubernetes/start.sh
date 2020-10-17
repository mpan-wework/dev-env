CLUSTER=$1

docker build --label k8s -t kube .
docker images -f "label=k8s"
docker run --rm -it \
  -v `pwd`:/root \
  -v /root/.oh-my-zsh \
  -v `pwd`/k8s.zsh-theme:/root/.oh-my-zsh/themes/k8s.zsh-theme \
  -e KUBECONFIG=/root/.kube/$CLUSTER kube zsh
