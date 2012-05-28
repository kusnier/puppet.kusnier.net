class restore::sshd {
  file { '/etc/ssh':
    ensure  => directory,
    source  => '/private-backup/backups/etc/ssh',
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  service { 'ssh':
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    subscribe   => File['/etc/ssh'],
  }
}
