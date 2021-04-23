#!/bin/bash

echo "installing JAVA"

yum -y install java-1.8.0-openjdk-devel
yum -y install java-1.8.0-openjdk

echo "installing TOmcat"

req_tom_ver="8.5.61"
tom_m_v=$(echo $req_tom_ver|cut -c 1)
url=https://mirrors.estointernet.in/apache/tomcat/tomcat-${tom_m_v}/v${req_tom_ver}/bin/apache-tomcat-8.5.61.tar.gz
wget $url
tar -xvzf apache-tomcat-${req_tom_ver}.tar.gz
mv apache-tomcat-${req_tom_ver} tomcat${tom_m_v}
rm -rf apache-tomcat-${req_tom_ver}.tar.gz

echo "installing Maven"

set -e

# script to install maven

# todo: add method for checking if latest or automatically grabbing latest
mvn_version=${mvn_version:-3.6.3}
url="https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
install_dir="/opt/maven"

if [ -d ${install_dir} ]; then
    mv ${install_dir} ${install_dir}.$(date +"%Y%m%d")
fi

mkdir ${install_dir}
curl -fsSL ${url} | tar zx --strip-components=1 -C ${install_dir}

cat << EOF > /etc/profile.d/maven.sh
#!/bin/sh
export MAVEN_HOME=${install_dir}
export M2_HOME=${install_dir}
export M2=${install_dir}/bin
export PATH=${install_dir}/bin:$PATH
EOF

source /etc/profile.d/maven.sh

echo maven installed to ${install_dir}
mvn --version

printf "\n\nTo get mvn in your path, open a new shell or execute: source /etc/profile.d/maven.sh\n"

echo "instaling GIT"
yum install git -y