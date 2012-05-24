class restore::mysql {
  exec { "restore-mysql-wpskdb":
    command   => '/bin/cat /private-backup/backups/mysql/wp_skdb.sql | /usr/bin/mysql -u root',
    creates   => '/var/lib/mysql/wp_skdb/',
    logoutput => true,
    require   => Package['mysql-server'],
  }

  exec { "restore-mysql-permissions":
    command     => '/bin/cat /private-backup/init/init_mysql_users.sql | /usr/bin/mysql -u root',
    refreshonly => true,
    subscribe   => Exec['restore-mysql-wpskdb'],
    logoutput   => true,
  }

  service { "mysql":
      hasstatus => true,
      enable    => true,
      ensure    => running,
      subscribe => Exec['restore-mysql-permissions']
  }
}
