class restore::mongo {
  exec { "restore-mongo":
    command   => '/usr/bin/mongorestore --drop /private-backup/backups/mongodb/dump',
    creates   => '/var/lib/mongodb/mxc.ns',
    logoutput => true,
    require   => Package['mongodb-10gen']
  }
}
