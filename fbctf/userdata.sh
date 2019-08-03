#UBUNTU 16.04
apt update && apt install -y \
    ntp git libboost-all-dev
service ntp stop
ntpd -gq
service ntp start

git clone https://github.com/facebook/fbctf
cd fbctf

./extra/provision.sh -m prod -s $PWD



#DOCKER
apt update && apt install -y \
    git apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"


apt update && apt install -y docker-ce

docker build --build-arg MODE=prod -t="fbctf_in_prod" .

#admin_pass: 31a311e40f8a6f4efdd58d2e89c29ae9