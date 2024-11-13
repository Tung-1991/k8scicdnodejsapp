Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
    
  config.vm.define "noble1" do |noble1|
    noble1.vm.box = "gusztavvargadr/ubuntu-server-2404-lts"
    noble1.vm.hostname = "noble1"
	  noble1.vm.network "private_network", ip: "192.168.42.113"
    noble1.vm.provider "vmware_desktop" do |vb|
     vb.cpus = 2
     vb.memory = 2048
    end
  end

  config.vm.define "noble2" do |noble2|
    noble2.vm.box = "gusztavvargadr/ubuntu-server-2404-lts"
    noble2.vm.hostname = "noble2"
	  noble2.vm.network "private_network", ip: "192.168.42.114"
    noble2.vm.provider "vmware_desktop" do |vb|
     vb.cpus = 4
     vb.memory = 4096
    end
  end

#  config.vm.define "jammy" do |jammy|1
#    jammy.vm.box = "generic/ubuntu2204"
#    jammy.vm.hostname = "jammy"
#    jammy.vm.network "private_network", ip: "192.168.42.114"
#    jammy.vm.provider "vmware_desktop" do |vb|
#     vb.cpus = 2
#     vb.memory = 2048
#    end
#  end
end