# Run rke2 install script and start the service
curl -sfL https://get.rke2.io | sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service

# wait until service generates kubeconfig

until [ -f /etc/rancher/rke2/rke2.yaml ]
do
     sleep 5
done

# set user permissions on rke2 kubeconfig and copy for local system availability
sudo chmod 755 /etc/rancher/rke2/rke2.yaml
cp /etc/rancher/rke2/rke2.yaml /vagrant/config/rke2.yaml

# install kubectl for client access inside vagrant guest
sudo snap install kubectl --classic
