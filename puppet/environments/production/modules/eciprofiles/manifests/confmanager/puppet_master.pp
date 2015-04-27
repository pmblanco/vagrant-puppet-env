class eciprofiles::confmanager::puppet_master {

  class { 'eciprofiles::confmanager::mcollective':
    hosts     => ['192.168.5.16'],
    connector => 'rabbitmq', 
    client    => true,
  }

  class { 'puppet::master':
#    manifestdir          => '/vagrant/puppet/manifests',
#    manifest             => '/vagrant/puppet/manifests/site.pp',
#    modulepath           => '/vagrant/puppet/modules',
    environmentpath      => '/vagrant/puppet/environments',
    dns_alt_names        => 'puppet.vag.ardemans.int',
    puppetdb_server      => 'puppet1.vag.ardemans.int',
    reports              => 'store,puppetdb',
    storeconfigs         => 'true',
    storeconfigs_backend => 'puppetdb',
    autosign             => ['*','*.prueba.com'],
    report               => 'true',
    certname             => 'puppet1.vag.ardemans.int',
    masterserver         => 'puppet1.vag.ardemans.int',
    agent_status         => 'stopped',
    rundir               => '/var/run/puppet',
    ssldir               => '/var/lib/puppet/ssl',
  }
  
  class { 'puppet::db':
    require   => Class['puppet::master'],
  }

}
