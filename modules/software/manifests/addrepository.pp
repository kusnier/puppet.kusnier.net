define software::addrepository ($repo = $title, $creates, $packages) {
  exec { "add-${repo}-repo":
    command     => "/usr/bin/apt-add-repository ${repo}",
    creates     => $creates,
    require     => Package['python-software-properties'],
  }

  exec { "${repo}-apt-get-update-after-add":
    command     => '/usr/bin/apt-get update',
    subscribe   => Exec["add-${repo}-repo"],
    refreshonly => true,
  }

  package { $packages:
    ensure  => installed,
    subscribe => Exec["${repo}-apt-get-update-after-add"],
  }
}
