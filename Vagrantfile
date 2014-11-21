# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/1/providers/virtualbox.box"
  config.vm.provision :shell, :path => "bootstrap"

  # Forward local port 8080 to guest port 80
  # config.vm.network "forwarded_port", guest: 80, host: 80
  # config.vm.network "forwarded_port", guest: 443, host: 443

  # Uncomment this line (and comment out the above one) to get a "public" ip
  config.vm.network "public_network", :bridge => "en0: Wi-Fi (AirPort)"
end
