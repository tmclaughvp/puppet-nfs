class nfs::client::debian inherits nfs::base {

  package { ["nfs-common", "portmap"]:
    ensure => present,
  }
 
  service { "portmap":
    ensure    => running,
    hasstatus => true,
    require   => Package["portmap"],
  }

}
