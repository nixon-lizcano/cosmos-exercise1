# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder "./www/", "/var/www/html"

  config.vm.define "ubuntu-server" do |vm1|
    vm1.vm.hostname = "ubuntu-server"
    vm1.vm.box = "bento/ubuntu-22.04"
    vm1.vm.network "private_network", ip: "192.168.56.10"
    # vm1.vm.network "forwarded_port", guest: 80, host: 8080

    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu-server"
      vb.gui = false
      vb.memory = "1024"
    end

    vm1.vm.provision "shell", inline: <<-SHELL
        #sudo apt-get update -y
	#sudo apt-get upgrade -y
	#sudo apt-get install net-tools
	#sudo apt-get install apache2 -y
	#sudo apt-get install php libapache2-mod-php php-mysql -y
	
	apt-get install apache2 -y
        apt-get install libapache2-mod-php -y
        apt-get install php-mysql -y
        apt-get install mysql-client -y

        # Enable apache mod_rewrite
        a2enmod rewrite
        a2enmod actions

        # Change AllowOverride from None to All
        sed -i '170,174 s/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

        # Start the webserver
        service apache2 restart
    SHELL

    vm1.vm.provision "shell", run: "always", inline: <<-SHELL
        echo "Hello from the Ubuntu VM"
    SHELL
  end

#  config.vm.define "centos-vm" do |vm2|
#    vm2.vm.hostname = "centos-vm"
#    vm2.vm.box = "bento/centos-stream-8"
#    vm2.vm.network "private_network", ip: "192.168.56.20"
#    vm2.vm.network :forwarded_port, guest: 80, host: 8080
#
#    vm2.vm.provider "virtualbox" do |vb|
#      vb.name = "centos-vm"
#      vb.gui = false
#      vb.memory = "1024"
#    end
#
#    vm2.vm.provision "shell", inline: <<-SHELL
#        sudo dnf update -y
#	sudo dnf install net-tools
#	sudo dnf install httpd -y
#     SHELL
#
#    vm2.vm.provision "shell", run: "always", inline: <<-SHELL
#		echo "Hello from the Centos Stream 8 VM"
#    SHELL
#  end
  
end
