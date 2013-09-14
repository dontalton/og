class og::ceph() {

  package {'radosgw':
    ensure => present,
  }

  package {'radosgw-agent':
    ensure => present,
  }

}
