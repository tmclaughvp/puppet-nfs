class nfs::client::debian inherits nfs::base {

  package { ["nfs-common", "portmap"]:
    ensure => present,
  }

  file { "/etc/default/portmap":
    ensure => present, owner => root, group => root,
    mode => 444, content => template("nfs/portmap.erb"),
    require => Package["portmap"], notify => Service["portmap"],
  }
  file { "/etc/default/nfs-common":
    ensure => present, owner => root, group => root,
    mode => 444, source => "puppet:///modules/nfs/nfs-common",
    require => Package["portmap"], 
  }
 
  service { "portmap":
    ensure    => running,
    hasstatus => true,
    require   => Package["portmap"],
  }

}
