class system {
  $systemname= 'matrixcode.de'

  file { '/etc/hostname':
    content => "${systemname}\n",
  }

  exec { 'update-hostname':
    command     => '/bin/hostname -F /etc/hostname',
    subscribe   => File['/etc/hostname'],
    refreshonly => true,
  }

  file { '/etc/mailname':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => "${systemname}\n",
    notify  => Service['exim4'],
  }

  service { 'exim4':
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    ensure     => running,
  }

  file { '/etc/default/locale':
    #  source => "puppet:///modules/system/locale.gen"
    content => 'en_US.UTF-8 UTF-8'
  }

  exec { 'locales':
    cwd         => '/etc',
    command     => '/usr/sbin/dpkg-reconfigure -f noninteractive locales',
    subscribe   => File['/etc/default/locale'],
    refreshonly => true,
    logoutput   => true,
  }
}
