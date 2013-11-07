# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "artifact-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "WIN2K8" 
  #config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://nexus.disney.com/nexus/content/repositories/remy/vagrant-boxes/win2k8/1.0/win2k8-1.0.box"
  #config.vm.box_url = "http://nexus.disney.com/nexus/content/repositories/remy/vagrant-boxes/dcs-rhel6/1.0/dcs-rhel6-1.0.box"
  #config.vm.box_url = 'https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box'

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120
  
  #config.vm.network :forwarded_port, guest: 3389, host: 3390


  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true
  
  config.vm.provision :shell, :inline => "yum -y --nogpgcheck install chef"
    
  config.vm.provision :shell, :inline => "sed -i 's/umask 077/umask 022/g' /etc/bashrc ; 
    sed -i 's/umask 077/umask 022/g' /etc/profile;
    chown -R vagrant:vagrant /tmp/vagrant-chef-1"

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "test/kitchen/data_bags"
    chef.json = { 
    }
    chef.run_list = [
      "recipe[applicaton::default]"
    ]
  end
end

