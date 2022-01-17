# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

vms = {
  'webserver-audit' => {'memory' => '2048', 'cpus' => 1, 'ip' => '11', 'box' => 'devopsbox/centos-8.5-docker', 'provision' => 'provision/ansible/webserver.yaml'},
  'graylog-audit' => {'memory' => '2560', 'cpus' => 1, 'ip' => '12', 'box' => 'devopsbox/ubuntu-20.04','provision' => 'provision/ansible/graylog.yaml'},
  'kibana-audit' => {'memory' => '2560', 'cpus' => 1, 'ip' => '13', 'box' => 'devopsbox/debian-10.11', 'provision' => 'provision/ansible/kibana.yaml'}
}

Vagrant.configure('2') do |config|

  config.vm.box_check_update = false

        if !(File.exists?('id_rsa'))
          system("ssh-keygen -b 2048 -t rsa -f id_rsa -q -N ''")
       end

  vms.each do |name, conf|
    config.vm.define "#{name}" do |k|
      k.vm.box = "#{conf['box']}"
      k.vm.hostname = "#{name}"
      k.vm.network 'private_network', ip: "172.16.0.#{conf['ip']}"
      k.vm.provider 'virtualbox' do |vb|
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
      k.vm.provision 'ansible_local' do |ansible|
        ansible.playbook = "#{conf['provision']}"
        ansible.compatibility_mode = '2.0'
      end
    end
  end
end
