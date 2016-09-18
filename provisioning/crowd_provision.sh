toilet --gay Install-Java

# Install Java
sudo apt-get -y install software-properties-common python-software-properties
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# Add JAVA_HOME to the environment
sudo echo JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java" >> /etc/environment

# Download and install Crowd
toilet --gay Install-Crowd
sudo mkdir -p /opt/atlassian/crowd
cd /opt/atlassian/crowd/
sudo wget https://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-2.10.1.tar.gz
sudo tar -xvf atlassian-crowd-2.10.1.tar.gz
sudo rm atlassian-crowd-2.10.1.tar.gz
sudo ln -s /opt/atlassian/crowd/atlassian-crowd-2.10.1/ current

# Copy the crowd init configuration file
sudo cp /home/vagrant/crowd-init.properties /opt/atlassian/crowd/current/crowd-webapp/WEB-INF/classes/crowd-init.properties 

echo "-----------------------------------------------------"
echo "Start the crowd server using:"
echo "sudo /opt/atlassian/crowd/current/start_crowd.sh"
echo "-----------------------------------------------------"

