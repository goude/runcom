echo Running provisioning script...

add-apt-repository ppa:neovim-ppa/stable
apt-get update

PACKAGES=$(cat master-list)
echo $PACKAGES
apt-get -y install $PACKAGES

# essentials
#apt-get install -y \
  #apt-transport-https \
  #build-essential \
  #ca-certificates \
  #cmake \
  #hdevtools \
  #linux-image-extra-$(uname -r) \
  #linux-image-extra-virtual \

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce
apt-get clean

gpasswd -a vagrant docker

# Get setup files for next stage.
git clone https://github.com/goude/runcom /tmp/runcom

echo Done.
