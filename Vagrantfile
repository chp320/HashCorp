# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "m-k8s" do |cfg|
    cfg.vm.box = "sysnet4admin/CentOS-k8s"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "m-k8s(github_SysNet4Admin)"
      vb.cpus = 2
      vb.memory = 2048
      vb.customize ["modifyvm", :id, "--groups", "/k8s-SM(github_SysNet4Admin)"]
    end
    cfg.vm.host_name = "m-k8s"
    cfg.vm.network "private_network", ip: "192.168.1.10"
    cfg.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    #cfg.vm.synced_folder "C:\\HashiCorp", "/vagrant_data"  # host�� C:\HashiCorp ���丮�� �Խ�Ʈ�� /vagrant_data ���丮�� ����ȭ��
    cfg.vm.provision "file", source: "CentOS-Base.repo", destination: "CentOS-Base.repo"
    cfg.vm.provision "shell", path: "changeRepo.sh"
    cfg.vm.provision "shell", path: "install_pkg.sh"
    cfg.vm.provision "file", source: "ping_2_nds.sh", destination: "ping_2_nds.sh"  # host�� �ִ� ping_2_nds.sh ������ guest�� Ȩ���丮(/home/vagrant)�� ����
    cfg.vm.provision "shell", path: "config.sh" # config.sh �� guest���� ���� (���⼭ host�� ������, guest�� centos)
  end

  #=============#
  # Added Nodes #
  #=============#

  (1..3).each do |i|  # 1���� 3���� 3���� ���ڸ� �ݺ��� i�� �Է�
    config.vm.define "w#{i}-k8s" do |cfg| # {i} ���� 1, 2, 3���� ������� ġȯ��
      cfg.vm.box = "sysnet4admin/CentOS-k8s"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "w#{i}-k8s(github_SysNet4Admin)"  # {i} ���� 1, 2, 3���� ���ʴ�� ġȯ��
        vb.cpus = 1
        vb.memory = 1024  # �޸𸮸� 1GB ����ϵ��� ����
        vb.customize ["modifyvm", :id, "--groups", "/k8s-SM(github_SysNet4Admin)"]
      end
      cfg.vm.host_name = "w#{i}-k8s"  # {i} ���� 1, 2, 3���� ���ʴ�� ġȯ��
      cfg.vm.network "private_network", ip: "192.168.1.10#{i}"  # {i} ���� 1, 2, 3���� ���ʴ�� ġȯ��
      cfg.vm.network "forwarded_port", guest: 22, host: "6001#{i}", auto_correct: true, id: "ssh"  # {i} ���� 1, 2, 3���� ���ʴ�� ġȯ��
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
      cfg.vm.provision "file", source: "CentOS-Base.repo", destination: "CentOS-Base.repo"
      cfg.vm.provision "shell", path: "changeRepo.sh"
      cfg.vm.provision "shell", path: "install_pkg.sh"
    end
  end
end