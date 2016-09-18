Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "crowd.home.net" 

  # Setup static ip address to be used with the Atlassian Suite of Application Servers
  config.vm.network "private_network", ip: "192.168.50.81"

  # Use an inline shell provisioner for basic setup 
  config.vm.provision 'shell', inline: shell, privileged: false

  # Copy over the crow init properites file
  config.vm.provision "file", source: "files/crowd-init.properties", destination: "crowd-init.properties"

  # Run provisioning specific to setting up Java and Crowd 
  config.vm.provision "shell", path: 'provisioning/crowd_provision.sh'

  # Support for Crowd on port 8095
  config.vm.network "forwarded_port", guest: 8095, host: 8095, id: "crowd"

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus   = 1
  end
end

def shell
  <<-eos
    echo Installing basic tools 
    sudo apt-get update
    sudo apt-get -y install vim git-core toilet
  eos
end
