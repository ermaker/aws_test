Vagrant.configure("2") do |config|
  config.vm.box = "dummy"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.vm.provider :aws do |aws, override|
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
end
