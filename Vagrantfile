# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider :aws do |aws,override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["SECRET_ACCESS_KEY"]

    aws.keypair_name = "default"
    override.ssh.private_key_path = "private/default.pem"

    aws.region = "ap-northeast-1"

    aws.ami = "ami-20b6aa21"
    override.ssh.username = "ubuntu"
    aws.instance_type = "t2.micro"
    aws.security_groups = "default_instance"
    aws.tags = {Name: 'Test with Vagrant'}
  end

  config.vm.provision :chef_solo do |chef|
  end

  config.vm.provider "virtualbox" do |vb,override|
    override.vm.box = "ubuntu/trusty64"
    vb.memory = "512"
  end
end
