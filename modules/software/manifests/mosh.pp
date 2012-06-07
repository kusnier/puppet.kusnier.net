class software::mosh {
  if $lsbdistid == 'Ubuntu' and $lsbmajdistrelease < 12 {
    software::addrepository { 'ppa:keithw/mosh':
      creates  => '/etc/apt/sources.list.d/keithw-mosh-lucid.list',
      packages => 'mosh',
    }
  } else {
    package { "mosh":
        ensure => installed,
    }
  }
}
