# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  dbName = "centos-db"

  config.vm.define dbName do |db|	
    db.vm.hostname = dbName
    db.vm.box = "bento/centos-stream-8"
    db.vm.box_check_update = true 
      
    db.vm.network "forwarded_port", guest: 3306, host: 3306, host_ip: "127.0.0.1"
    db.vm.network "private_network", ip: "192.168.33.20"

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
    SHELL
  end
end
