Vagrant.configure("2") do |config|

  config.vm.define "scriptbox" do |scriptbox|
    scriptbox.vm.box = "spox/ubuntu-arm"
    scriptbox.vm.network "private_network", ip: "192.168.10.12"
    scriptbox.vm.provider "vmware_desktop" do |vb|
      vb.gui = true
      vb.memory = "1024"
    end
   end

  config.vm.define "web01" do |web01|
    web01.vm.box = "spox/ubuntu-arm"
    web01.vm.network "private_network", ip: "192.168.10.13"
    web01.vm.provider "vmware_desktop" do |vb|
      vb.gui = true
      vb.memory = "1024"
    end
  end
  
  config.vm.define "web02" do |web02|
    web02.vm.box = "spox/ubuntu-arm"
    web02.vm.network "private_network", ip: "192.168.10.14"
    web02.vm.provider "vmware_desktop" do |vb|
      vb.gui = true
      vb.memory = "1024"
    end
  end

   config.vm.define "web03" do |web03|
    web03.vm.box = "spox/ubuntu-arm"
    web03.vm.network "private_network", ip: "192.168.10.15"
    web03.vm.provider "vmware_desktop" do |vb|
      vb.gui = true
      vb.memory = "1024"
    end
  end
end
