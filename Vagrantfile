# This guide is optimized for Vagrant 1.7 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version ">= 1.7.0"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "ubuntu/xenial64"

    config.vm.provider "virtualbox" do |v|
        v.name = "ansible-local-vm"
        v.memory = 512
        v.cpus = 2
    end

    # Disable the new default behavior introduced in Vagrant 1.7, to
    # ensure that all Vagrant machines will use the same SSH key pair.
    # See https://github.com/mitchellh/vagrant/issues/5005
    config.ssh.insert_key = false

    # Installs latest Ansible release (stable functionality)
    config.vm.define "develop", primary: true do |develop|
        develop.vm.provision :shell, path: "bootstrap-build.sh"
        develop.vm.provision :file, source: "bootstrap.sh", destination: "bootstrap.sh"
    end

    # Sync the user's home folder
    config.vm.synced_folder "~/", "/home/vagrant/host-machine", mount_options: ["dmode=775,fmode=664"]
end