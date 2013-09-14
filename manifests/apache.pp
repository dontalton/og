class og::apache() {

  package {'apache2':
    ensure => present,
  }

  package {'libapache2-mod-fastcgi':
    ensure => present,
  }

  exec {'rewrite':
    command => '/usr/sbin/a2enmod rewrite',
  }

  exec {'fastcgi':
    command => '/usr/sbin/a2enmod fastcgi',
  }

  service {'apache2':
    ensure  => running,
    require => [ Package['apache2'], File['hostname.httpd.conf'] ],
  }

  file {'hostname.httpd.conf':
    path => '/etc/apache2/httpd.conf',
    content => template('og/hostname.http.conf'),
  }



}
