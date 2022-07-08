# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  dbName = "centos-db"
  svName = "ubuntu-server"
  config.vm.synced_folder "./www/", "/var/www/html"

  config.vm.define svName do |vm1|
    vm1.vm.hostname = svName
    vm1.vm.box = "bento/ubuntu-22.04"
    vm1.vm.network "private_network", ip: "192.168.56.10"

    vm1.vm.provider "virtualbox" do |vb|
      vb.name = svName
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
