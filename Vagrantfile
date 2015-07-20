# -*- mode: ruby -*-
# vi: set ft=ruby :

require "dotenv"
Dotenv.load

Vagrant.configure("2") do |config|
  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "roles"
    chef.add_role("server")
  end

  config.vm.provision :docker do |d|
    d.build_image "/vagrant/app/mshard_server", args: "-t mshard_server"
    d.run "nginx", args: "-v /vagrant/html/:/usr/share/nginx/html:ro -p 80:80"

    d.run "mshard_server", args: [
      "-p 8080:80",
      *ENV.select {|k,v| k =~ /^MSHARD_/}.map do |k,v|
        "-e " + k[/^MSHARD_(.*)$/, 1] + "=" + v
      end
    ].join(" ")
  end

  config.vm.provider :aws do |aws,override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["SECRET_ACCESS_KEY"]

    aws.keypair_name = "default"
    override.ssh.private_key_path = "private/default.pem"

    aws.ami = "ami-20b6aa21"
    override.ssh.username = "ubuntu"

    aws.region = "ap-northeast-1"
    aws.instance_type = "t2.micro"
    aws.security_groups = "default_instance"
    aws.tags = {Name: "Test with Vagrant"}
    aws.elastic_ip = ENV['ELASTIC_IP']
  end

  config.vm.provider "virtualbox" do |vb,override|
    override.vm.box = "ubuntu/trusty64"
    vb.memory = "512"
  end
end
