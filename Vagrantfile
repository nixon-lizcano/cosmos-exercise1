# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  dbName = "centos-db"
  svName = "ubuntu-server"
  config.vm.synced_folder "./www/", "/var/www/html"

  config.vm.define dbName do |db|	
    db.vm.hostname = dbName
    db.vm.box = "bento/centos-stream-8"
    db.vm.box_check_update = true 
      
    db.vm.network "forwarded_port", guest: 3306, host: 3306, host_ip: "127.0.0.1"
    db.vm.network "private_network", ip: "192.168.56.20"

    db.vm.synced_folder "./SyncFolder", "/vagrant_data/SyncFolder"

    db.vm.provider "virtualbox" do |vb|
      vb.name = dbName
      vb.gui = false
      vb.cpus = 2
      vb.memory = "2048"
    end

    db.vm.provision "shell", inline: <<-SHELL
      sudo dnf install -y mysql-server
      sudo systemctl status mysqld

      echo "MySQL installed"
      mysql -V
      sudo systemctl start mysqld

      sudo mysqladmin -u root password vagrant
      cat /vagrant_data/SyncFolder/init.sql | sudo mysql -u root -pvagrant
      cat /vagrant_data/SyncFolder/test_empleados.sql | sudo mysql -u root -pvagrant
    SHELL
  end

  config.vm.define svName do |vm2|
    vm2.vm.hostname = svName
    vm2.vm.box = "bento/ubuntu-22.04"
    vm2.vm.network "private_network", ip: "192.168.56.10"

    vm2.vm.provider "virtualbox" do |vb|
      vb.name = svName
      vb.gui = false
      vb.memory = "1024"
    end

    vm2.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      sudo apt-get update -y
      sudo apt-get upgrade -y
      sudo apt-get install net-tools -y
      sudo apt-get install apache2 php7.2 libapache2-mod-php php-mysql -y
      sudo apt-get install mysql-client -y
      sudo service apache2 restart
    SHELL

    vm2.vm.provision "shell", run: "always", inline: <<-SHELL
      echo "Hello from the Ubuntu VM"
    SHELL
  end
  
end
