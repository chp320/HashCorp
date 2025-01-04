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
    #cfg.vm.synced_folder "C:\\HashiCorp", "/vagrant_data"  # host의 C:\HashiCorp 디렉토리가 게스트의 /vagrant_data 디렉토리와 동기화됨
    cfg.vm.provision "file", source: "CentOS-Base.repo", destination: "CentOS-Base.repo"
    cfg.vm.provision "shell", path: "changeRepo.sh"
    cfg.vm.provision "shell", path: "install_pkg.sh"
    cfg.vm.provision "file", source: "ping_2_nds.sh", destination: "ping_2_nds.sh"  # host에 있는 ping_2_nds.sh 파일을 guest의 홈디렉토리(/home/vagrant)로 전달
    cfg.vm.provision "shell", path: "config.sh" # config.sh 를 guest에서 실행 (여기서 host는 윈도우, guest는 centos)
  end

  #=============#
  # Added Nodes #
  #=============#

  (1..3).each do |i|  # 1부터 3까지 3개의 인자를 반복해 i로 입력
    config.vm.define "w#{i}-k8s" do |cfg| # {i} 값이 1, 2, 3으로 차레대로 치환됨
      cfg.vm.box = "sysnet4admin/CentOS-k8s"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "w#{i}-k8s(github_SysNet4Admin)"  # {i} 값이 1, 2, 3으로 차례대로 치환됨
        vb.cpus = 1
        vb.memory = 1024  # 메모리를 1GB 사용하도록 변경
        vb.customize ["modifyvm", :id, "--groups", "/k8s-SM(github_SysNet4Admin)"]
      end
      cfg.vm.host_name = "w#{i}-k8s"  # {i} 값이 1, 2, 3으로 차례대로 치환됨
      cfg.vm.network "private_network", ip: "192.168.1.10#{i}"  # {i} 값이 1, 2, 3으로 차례대로 치환됨
      cfg.vm.network "forwarded_port", guest: 22, host: "6001#{i}", auto_correct: true, id: "ssh"  # {i} 값이 1, 2, 3으로 차례대로 치환됨
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
      cfg.vm.provision "file", source: "CentOS-Base.repo", destination: "CentOS-Base.repo"
      cfg.vm.provision "shell", path: "changeRepo.sh"
      cfg.vm.provision "shell", path: "install_pkg.sh"
    end
  end
end