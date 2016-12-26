class restore::userfiles {
  exec { 'restore-home-seek':
    command   => '/usr/bin/rsync --archive -v --delete /private-backup/backups/home/seek /home',
    onlyif    => '/usr/bin/test ! -d /home/seek/dotfiles',
    require   => User['seek'],
    logoutput => true,
    timeout   => 0,
    notify    => Service['exim4'],
  }

  exec { 'restore-home-root':
    command   => '/usr/bin/rsync --archive -v --delete /private-backup/backups/root/. /root',
    onlyif    => '/usr/bin/test ! -d /root/devel',
    logoutput => true,
    timeout   => 0,
  }
  
  file { '/etc/network/if-up.d/1_fw':
    ensure    => link,
    target    => '/root/firewall.conf/eth0fw.sh',
    subscribe => Exec['restore-home-root'],
  }

  #  exec { 'seek-dotfiles':
  #    cwd       => '/home/seek',
  #    command   => '/usr/bin/git clone --recursive git://github.com/kusnier/dotfiles.git',
  #    user      => 'seek',
  #    onlyif    => '/usr/bin/test ! -d /home/seek/dotfiles',
  #    logoutput => true,
  #    require   => Package['git-core'],
  #  }

}
