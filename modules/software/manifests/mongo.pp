class software::mongo {

  if Package['upstart'] {
    $mongorepo= "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen\n"
  } else {
    $mongorepo= "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen\n"
  }

  file { '10gen-repo':
    path    => '/etc/apt/sources.list.d/10gen.list',
    ensure  => file,
    owner   => "root",
    group   => "root",
    content => $mongorepo,
  }

  exec { '10gen-deiban-key':
    command     => '/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10',
    subscribe   => File['10gen-repo'],
    refreshonly => true,
  }

  exec { "10gen-apt-get-update-after-add":
    command     => "/usr/bin/apt-get update",
    subscribe   => File['10gen-deiban-key'],
    refreshonly => true,
  }

  package { 'mongodb-10gen':
    ensure  => installed,
    require => Exec['10gen-apt-get-update-after-add'],
  }
}
