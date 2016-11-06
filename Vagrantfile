# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/precise64'
  config.vm.hostname = 'precimonious-box'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "24576"
    vb.cpus   = 8
  end


  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true, privileged: false
end
