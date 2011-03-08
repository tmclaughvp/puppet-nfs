class nfs::server inherits nfs::base {
  require apt
  
  package {"nfs-kernel-server":
    ensure => present,
  }
  
  exec {"reload_nfs_srv":
    command     => "/etc/init.d/nfs-kernel-server reload",
    refreshonly => true,
    require => Package["nfs-kernel-server"]
  }

  service {"nfs-kernel-server":
    enable      => "true",
    hasstatus   => "true",
    require     => Package["nfs-kernel-server"]
  }
}
