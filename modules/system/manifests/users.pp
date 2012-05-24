class system::users {
  group { "seek":
      ensure => present
  }

  user { 'seek':
    ensure     => present,
    require    => Group['seek'],
    gid        => 'seek',
    shell      => '/bin/zsh',
    home       => '/home/seek',
    managehome => true,
    groups     => ['adm', 'admin'],
  }

  cron { 'mxc-startpage':
    ensure  => present,
    require => User['seek'],
    user    => seek,
    command => '/home/seek/scripts/pid_mxc_node.sh',
    minute  => '*/1',
  }

  cron { 'mxc-redirects':
    ensure  => present,
    require => User['seek'],
    user    => seek,
    command => 'cd /home/seek/public_subdomains/mxc_startpage; nodeunit --config test/nodeunit.json  test',
    hour    => ['9'],
    minute  => '30',
    #environment => 'SK_EVN="test"'
  }

  # Root crontabs
  cron { 'backup':
    ensure  => present,
    user    => 'root',
    command => '/private-backup/backup_server.sh',
    hour    => '1',
    minute  => '1',
  }

}
