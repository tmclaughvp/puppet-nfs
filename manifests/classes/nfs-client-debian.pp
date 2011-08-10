class nfs::client::debian inherits nfs::base {

  package { ["nfs-common", "portmap"]:
    ensure => present,
  }

  file { "/etc/default/portmap":
    ensure => present, owner => root, group => root,
    mode => 555, content => template("nfs/portmap.erb"),
    require => Package["portmap"], notify => Service["portmap"],
  }
 
  service { "portmap":
    ensure    => running,
    hasstatus => true,
    require   => Package["portmap"],
  }

}
