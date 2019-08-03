#UBUNTU 16.04
apt update && apt install -y \
    ntp git
service ntp stop
ntpd -gq
service ntp start

git clone https://github.com/facebook/fbctf
cd fbctf

./extra/provision.sh -m prod -s $PWD

