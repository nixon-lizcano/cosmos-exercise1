## Fetures
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