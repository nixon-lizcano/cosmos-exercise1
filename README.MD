# Exercise 1: Vagrantfile with 2 virtual machines

For this exercise we used Vagrant as an open source tool that allows to create, configure and manage virtual machine boxes, and we tested it with a CRUD of employees, based on https://obedalvarado.pw/blog/crud-datos-empleados-php-mysql-bootstrap/.

The Vagranfile instances two virtual machines, one with Ubuntu-22.04 and another with Centos Stream 8, both based on https://app.vagrantup.com/bento.

## Features

- MySQL server on port 3302
- WebServer on port 80
- Sync folder and private network among vms

## Requirements

- Virtualbox >= 6.1.34 r150636 (Qt5.6.2)
- Vagrant >= 2.2.19

## Installation

In the project directory type the following command in the command line to build and start the project
```bash
vagrant up
```

If you got a "no guest aditions" error doing vagrant up try installing this plugin
```bash
vagrant plugin install vagrant-vbguest
```

### References

- PHP Aplication Source code: [Web Page](https://obedalvarado.pw/blog/crud-datos-empleados-php-mysql-bootstrap/)
