# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

	# basebox stuff
	config.vm.box = "ubuntu/trusty32"
	config.vbguest.auto_update = true

	# hostname and private IP -- CHANGE THE IP TO SOMETHING ELSE
	config.vm.network :private_network, ip: "10.11.12.33"
	
	# Ensure this matches your domain in group_vars/all
	# config.vm.hostname = "api.ami.local"
	config.vm.hostname = "diy-transparency.local"
	config.hostsupdater.aliases = ["api.diy-transparency.local"]
	config.vm.network :forwarded_port, guest: 22, host: 1234, auto_correct: true

	# vbox specific config
	config.vm.provider "virtualbox" do |v|
	v.name = "DIYTransparency"
	v.memory = 1024
	end

	# Sync ami files for editing
	config.vm.synced_folder "code-frontend", "/var/www/trans-frontend-source"
	config.vm.synced_folder "code-api", "/var/www/api"

	# INSTALL STUFF HERE
	config.vm.provision "ansible" do |ansible|
		ansible.verbose = "v"
		ansible.playbook = "backup.yml"
	end

end
