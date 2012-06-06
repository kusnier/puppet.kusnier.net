class software::mosh {
  if $lsbdistid == 'Ubuntu' and $lsbmajdistrelease < 12 {
    exec { 'add-mosh-repo':
      command     => '/usr/bin/apt-add-repository ppa:keithw/mosh',
      creates     => '/etc/apt/sources.list.d/keithw-mosh.js-lucid.list',
      require     => Package['python-software-properties'],
    }

    exec { 'mosh-apt-get-update-after-add':
      command     => '/usr/bin/apt-get update',
      subscribe   => Exec['add-mosh-repo'],
      refreshonly => true,
    }
  }

  package { "mosh":
      ensure => installed,
      subscribe => Exec['mosh-apt-get-update-after-add'],
  }
}
