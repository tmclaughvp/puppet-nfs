class nfs::client::debian inherits nfs::base {

  package { ["nfs-common", "portmap"]:
    ensure => present,
  }
  warn ('Including nfs::client::debian on $fqdn')
 
  service { "nfs-common":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Package["nfs-common"],
  }
 
  service { "portmap":
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => Package["portmap"],
  }

}
