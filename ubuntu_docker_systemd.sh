#systemd

#To use the systemd cgroup driver, set plugins.cri.systemd_cgroup = true in /etc/containerd/config.toml. When using kubeadm, manually configure the cgroup driver for kubelet



#Letting iptables see bridged traffic

#As a requirement for your Linux Node’s iptables to correctly see bridged traffic, you should ensure net.bridge.bridge-nf-call-iptables is set to 1 in your sysctl config, e.g.

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

#Make sure that the br_netfilter module is loaded before this step. This can be done by running:
lsmod | grep br_netfilter  #To load it explicitly call: 
modprobe br_netfilter

#For more details please see the Network Plugin Requirements page
#https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/#network-plugin-requirements

# ensure legacy binaries are installed
sudo apt-get install -y iptables arptables ebtables

# switch to legacy versions
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy

#You will install these packages on all of your machines:

#    kubeadm: the command to bootstrap the cluster.

#    kubelet: the component that runs on all of the machines in your cluster and does things like starting pods and containers.

#    kubectl: the command line util to talk to your cluster.

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


#Configure cgroup driver used by kubelet on control-plane node

#When using Docker, kubeadm will automatically detect the cgroup driver for the kubelet and set it in the /var/lib/kubelet/kubeadm-flags.env file during runtime.

#If you are using a different CRI, you have to modify the file /etc/default/kubelet (/etc/sysconfig/kubelet for CentOS, RHEL, Fedora) with your cgroup-driver value, like so:

#KUBELET_EXTRA_ARGS=--cgroup-driver=<value>
KUBELET_EXTRA_ARGS=--cgroup-driver=systemd

#This file will be used by kubeadm init and kubeadm join to source extra user defined arguments for the kubelet.

#Please mind, that you only have to do that if the cgroup driver of your CRI is not cgroupfs, because that is the default value in the kubelet already.

#Restarting the kubelet is required:

systemctl daemon-reload
systemctl restart kubelet

#The automatic detection of cgroup driver for other container runtimes like CRI-O and containerd is work in progress





#Containerd

#This section contains the necessary steps to use containerd as CRI runtime.

#Use the following commands to install Containerd on your system:
#Prerequisites

cat > /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat > /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sysctl --system




# Install containerd
## Set up the repository
### Install packages to allow apt to use a repository over HTTPS
apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common

### Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

### Add Docker apt repository.
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

## Install containerd
apt-get update && apt-get install -y containerd.io

# Configure containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

# Restart containerd
systemctl restart containerd
