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

  file { '/etc/locale.gen':
    #  source => "puppet:///modules/system/locale.gen"
    content => 'en_US.UTF-8 UTF-8'
  }

  exec { 'locales':
    cwd         => '/etc',
    command     => '/usr/sbin/dpkg-reconfigure -f noninteractive locales',
    subscribe   => File['/etc/locale.gen'],
    refreshonly => true,
    logoutput   => true,
  }
}
