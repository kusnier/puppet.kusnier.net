class system {
  file { '/etc/hostname':
    content => 'matrixcode.de'
  }

  exec { 'update-hostname':
    command     => '/bin/hostname -F /etc/hostname',
    subscribe   => File['/etc/hostname'],
    refreshonly => true,
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
