class software {
  $syspackages= [
    'apache2',
    'dnsutils',
    'colordiff',
    'curl',
    'exim4',
    'exuberant-ctags',
    'git-core',
    'htop',
    'libapache2-mod-php5',
    'lsof',
    'lynx',
    'mercurial',
    'moreutils',
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

  $delpackages= [
    'libapache2-mod-php5',
    'php5',
    'php5-mysql',
    'phpmyadmin',
  ]

  package { $syspackages:
    ensure => purged,
  }
}


