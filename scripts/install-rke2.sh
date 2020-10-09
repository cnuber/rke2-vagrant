RKE2_CONFIG_DIRECTORY=/etc/rancher/rke2/
SERVER_MANIFEST_DIRECTORY=/var/lib/rancher/rke2/server/manifests/


sudo mkdir -p $RKE2_CONFIG_DIRECTORY
sudo mkdir -p $SERVER_MANIFEST_DIRECTORY
sudo cp /vagrant/files/calico.yaml $SERVER_MANIFEST_DIRECTORY
sudo cp /vagrant/files/rke2-config.yaml $RKE2_CONFIG_DIRECTORY/config.yaml

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
mkdir -p /vagrant/config
sudo chmod 755 /etc/rancher/rke2/rke2.yaml
cp -r /etc/rancher/rke2/rke2.yaml /vagrant/config/rke2.yaml

# install kubectl for client access inside vagrant guest
sudo snap install kubectl --classic
