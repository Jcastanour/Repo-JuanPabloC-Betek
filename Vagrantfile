Vagrant.configure("2") do |config|
  config.vm.define "server" do |server|
    server.vm.box = "generic/rocky9"
    server.vm.hostname = "server"
    server.vm.box_version = "4.3.12"

    server.vm.network "private_network", ip: "192.168.40.254", virtualbox__intnet: true

    server.vm.provider "virtualbox" do |vb|
      vb.name = "rocky9-server"
      vb.memory = 2048
      vb.cpus = 2
    end

    server.vm.provision "shell", path: "bootstrap.sh", run: "once"
  end
end
