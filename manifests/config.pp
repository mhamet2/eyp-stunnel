class stunnel::config inherits stunnel {

  concat { '/etc/stunnel.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment{ '/etc/stunnel.conf header':
    target  => '/etc/stunnel.conf',
    content => "#\n# puppet managed file\n#\n\n",
    order   => '00',
  }
}
