
Vagrant.configure("2") do |config|

  config.vm.define "prestashop" do |host|
    #host.vm.box     = "ubuntu/focal64"   # ubuntu 20.04 LTS (Focal Fossa)
    host.vm.box      = "ubuntu/bionic64"  # ubuntu 18.04 LTS (Bionic Beaver)
    host.vm.hostname = "vanilla-prestashop"
    host.vm.synced_folder "salt/roots/",   "/srv/salt/"
    host.vm.synced_folder "salt/pillar/",  "/srv/pillar/"
    #host.vm.network "forwarded_port", guest: 80, host: 8080
    host.vm.network "forwarded_port", guest: 8080, host: 8080
  end

  # Necessitem aquest paquet abans d'executar
  # el "provision :salt"
  config.vm.provision "shell",
    # ubuntu 20.04 LTS (Focal Fossa)
    #inline: "apt-get -y update ; apt-get -y install python3-pygit2"
    # ubuntu 18.04 LTS (Bionic Beaver)
    inline: "apt-get -y update ; apt-get -y install python-pygit2"

  config.vm.provision :salt, run: "always" do |salt|
    salt.masterless    = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.colorize      = true
    salt.verbose       = true
  end
end

