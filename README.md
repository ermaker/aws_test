# Vagrant + AWS

## Setup

1. AWS Setup
  1. Create access key id and secret access key (See also [here](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html))
    1. Create IAM User
    1. Create Manage Key
    1. Attach policy "AmazonEC2FullAccess"
  1. Key pair
    1. Create key pair
    1. Download private key
  1. Create security groups
1. Execute (on ubuntu 64bit)
```
## See http://www.vagrantup.com/downloads
$ wget "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.3_x86_64.deb"
# dpkg -i vagrant_1.7.3_x86_64.deb
$ vagrant plugin install vagrant-aws
$ vagrant plugin install vagrant-env
## Create .env with .env.example
$ vim .env
## Edit Vagrantfile
$ vim Vagrantfile
```

## Usage
```
$ vagrant up
$ vagrant ssh
$ vagrant halt
$ vagrant destroy
```

## References
https://www.vagrantup.com/
https://github.com/mitchellh/vagrant-aws
http://www.devopsdiary.com/blog/2013/05/07/automated-deployment-of-aws-ec2-instances-with-vagrant-and-puppet/
https://github.com/gosuri/vagrant-env
http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html
