class restore::apache {
  file { '/etc/apache2/sites-available':
    ensure  => directory,
    source  => '/private-backup/backups/etc/apache2/sites-available',
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  file { '/etc/apache2/mods-enabled':
    ensure  => directory,
    source  => '/private-backup/backups/etc/apache2/mods-enabled',
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  /*
  file { '/etc/apache2/apache.pem':
    ensure  => present,
    source  => '/private-backup/backups/etc/apache2/apache.pem',
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }
  */

  file { '/etc/apache2/sites-enabled':
    ensure  => directory,
    source  => '/private-backup/backups/etc/apache2/sites-enabled',
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  service { 'apache2':
      hasstatus => true,
      enable    => true,
      ensure    => running,
      /*subscribe => [File['/etc/apache2/sites-enabled'], File['/etc/apache2/mods-enabled'], File['/etc/apache2/apache.pem']]*/
      subscribe => [File['/etc/apache2/sites-enabled'], File['/etc/apache2/mods-enabled']]
  }
}
