class nfs::client::debian inherits nfs::base {

  package { ["nfs-common", "portmap"]:
    ensure => present,
  }
  notice ('Including nfs::client::debian on $fqdn')
 
  service { "portmap":
    ensure    => running,
    hasstatus => true,
    require   => Package["portmap"],
  }

}
