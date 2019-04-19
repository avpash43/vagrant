HOSTNAME = "epbygrow0056t0"
SYNCED_FOLDER = "C:/Users/Aleksandr_Pashkovski/Data/Projects/EPM-LDI"
MEMORY = "4096"
CPU = "4"
NAME = "Centos 7"
SYSTEM_SH = "once"
TOOLS_SH = "once"
DOCKER_SH = "once"
ENV_SH = "once"

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = HOSTNAME
  config.vm.network "public_network"
  config.vm.box_check_update = true
  config.vm.synced_folder SYNCED_FOLDER, "/vagrant", type: "virtualbox", disabled: false

  config.vm.provider "virtualbox" do |vb|
  vb.memory = MEMORY
  vb.cpus = CPU
  vb.name = NAME
  end

  config.vm.provision "shell", path: "system.sh", privileged: false, run: SYSTEM_SH
  config.vm.provision "shell", path: "tools.sh", privileged: false, run: TOOLS_SH
  config.vm.provision "shell", path: "docker.sh", privileged: false, run: DOCKER_SH
  config.vm.provision "shell", path: "env.sh", privileged: false, run: ENV_SH
end
