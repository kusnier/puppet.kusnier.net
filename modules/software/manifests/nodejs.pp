class software::nodejs {
  package { 'python-software-properties':
    ensure => installed,
  }

  exec { 'add-nodejs-repo':
    command     => '/usr/bin/apt-add-repository ppa:chris-lea/node.js',
    creates     => '/etc/apt/sources.list.d/chris-lea-node.js-lucid.list',
    require     => Package['python-software-properties'],
  }

  exec { 'nodejs-apt-get-update-after-add':
    command     => '/usr/bin/apt-get update',
    subscribe   => Exec['add-nodejs-repo'],
    refreshonly => true,
  }

  package { 'nodejs':
    ensure  => installed,
    subscribe => Exec['nodejs-apt-get-update-after-add'],
  }

  package { 'npm':
    ensure  => installed,
    subscribe => Exec['nodejs-apt-get-update-after-add'],
  }

}
