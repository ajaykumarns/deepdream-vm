BOX_NAME = ENV['BOX_NAME'] || "caffe-ml"
APP_DATA = ENV['APP_DATA']
VM_MEMORY = ENV['VM_MEMORY'] || "2048"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :forwarded_port, :host => 8080, :guest => 8000

  config.vm.provider :virtualbox do |vb|
    vb.name = BOX_NAME
    vb.customize ["modifyvm", :id, "--memory", VM_MEMORY]
    vb.cpus = 3
  end

  # setting the hostname
  config.vm.hostname = "#{BOX_NAME}"

  config.vm.provision :shell, path: "provision.sh"

  ###  syncing the top level folders
  config.vm.synced_folder ".", "/vagrant/data"
end
