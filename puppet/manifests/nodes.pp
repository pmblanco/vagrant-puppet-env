node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    install_mcollective   => false,
  }

  class { 'mcollective':
    middleware_hosts      => [ '192.168.5.16' ],
    connector             => 'rabbitmq',
	client                => true,
  }
  
  class { 'roles::puppet_master':
  }
  
}

node 'dashboard1.vag.ardemans.int' {


  class { 'roles::common':
  }->

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/var/lib/puppet/ssl',
  }->
  
  class { 'roles::puppet_services':
  }
  
  
}
