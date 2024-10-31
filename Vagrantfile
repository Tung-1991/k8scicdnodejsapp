#test
Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
    
  config.vm.define "admin" do |admin|
    admin.vm.box = "gusztavvargadr/ubuntu-server-2404-lts"
    admin.vm.hostname = "admin"
	admin.vm.network "private_network", ip: "192.168.42.113"
    admin.vm.provider "vmware_desktop" do |vb|
     vb.cpus = 4
     vb.memory = 4096
    end
  end
end