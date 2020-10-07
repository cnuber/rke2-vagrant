Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision "shell", path: "scripts/install-rke2.sh"
  config.vm.network "forwarded_port", guest: 6443, host: 6443
  config.vm.provision "shell", privileged: false, inline: <<-EOF
    echo "RKE2 is up and running!"
    echo "to access kubernetes locally, run export KUBECONFIG=config/rke2.yaml"
    echo "to access kubernetes within the guest machine, run vagrant ssh and then export KUBECONFIG=/etc/rancher/rke2/rke2.yaml"
    echo "run kubectl get pods -A to see the running pods"
  EOF
end
