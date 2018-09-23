class system::users {
  group { "seek":
      ensure => present
  }

  user { 'seek':
    ensure     => present,
    require    => Group['seek'],
    gid        => 'seek',
    shell      => '/usr/bin/fish',
    home       => '/home/seek',
    managehome => true,
    groups     => ['sudo'],
  }

  cron { 'mxc-startpage':
    ensure  => present,
    require => User['seek'],
    user    => seek,
    command => '/home/seek/cron_check_wildfly.sh',
    minute  => '*/1',
  }

  cron { 'mxc-redirects':
    ensure  => absent,
    require => User['seek'],
    user    => seek,
    command => 'cd /home/seek/public_subdomains/mxc_startpage; mocha --reporter tap',
    hour    => ['9'],
    minute  => '30',
    environment => 'NODE_PATH=/usr/lib/node_modules'
  }

  # Root crontabs
  cron { 'backup':
    ensure  => present,
    user    => 'root',
    command => '/private-backup/backup_server.sh',
    hour    => '3',
    minute  => '1',
  }

}
