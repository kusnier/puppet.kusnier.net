class restore::mongo {
  exec { "mongo-only-localhost":
    command => '/bin/echo "bind_ip = 127.0.0.1" >> /etc/mongodb.conf',
    unless  => '/bin/grep "^bind_ip = 127.0.0.1" /etc/mongodb.conf',
    require => Package['mongodb-10gen'],
    before  => Exec['restore-mongo'],
    notify  => Service['mongodb'],
  }

  service { 'mongodb':
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    ensure     => running,
  }

  exec { "restore-mongo":
    command   => '/usr/bin/mongorestore --drop /private-backup/backups/mongodb/dump',
    creates   => '/var/lib/mongodb/mxc.ns',
    logoutput => true,
    require   => [Package['mongodb-10gen'], Service['mongodb']],
    tries     => 5,
    try_sleep => 2,
  }
}
