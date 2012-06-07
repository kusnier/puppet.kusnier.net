class software {
  $syspackages= [
    'apache2',
    'colordiff',
    'curl',
    'exuberant-ctags',
    'git-core',
    'htop',
    'libapache2-mod-php5',
    'lsof',
    'lynx',
    'mercurial',
    'ncftp',
    'netcat',
    'nmap',
    'php5',
    'php5-mysql',
    'phpmyadmin',
    'python-software-properties',
    'ruby',
    'screen',
    'subversion',
    'svnmailer',
    'tcpdump',
    'traceroute',
    'tree',
    'unrar-free',
    'unzip',
    'vim',
    'wget',
    'zsh',
  ]

  package { $syspackages:
    ensure => installed,
  }

  define addrepository ($repo = $title, $creates, $packages) {
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

}


