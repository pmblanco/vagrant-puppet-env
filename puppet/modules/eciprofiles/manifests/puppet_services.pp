class eciprofiles::puppet_services {

 
  class { 'apache':
    default_vhost   => false,
	mpm_module      => false,
  }
  
  class { 'apache::mod::worker':
    startservers        => '2',
    maxclients          => '10',
    minsparethreads     => '3',
    maxsparethreads     => '3',
    threadsperchild     => '10',
    maxrequestsperchild => '100',  
    serverlimit         => '10',	
    threadlimit         => '20',	
  }
  
  case $::operatingsystem {
    'Ubuntu': {
	  $puppetboard_path = '/usr/local/lib/python2.7/dist-packages/puppetboard/static'
	  $puppetboard_user = 'www-data'
	  $puppetboard_group = 'www-data'
	}
	
	'CentOS','RedHat': {
	  $puppetboard_path = '/usr/lib/python2.6/site-packages/puppetboard'
	  $puppetboard_user = 'apache'
	  $puppetboard_group = 'apache'
	}
  }
  
  apache::vhost { 'puppetboard':
    port                        => '80',
    docroot                     => '/var/www/puppetboard',
	aliases                     => [
	  { alias   => '/static',
	    path    => "${puppetboard_path}/static",
	  }
	],
	directories                 => [
	  {
	    path             => '/var/www/puppetboard',
		options          => 'Indexes FollowSymLinks MultiViews'
	  },
	  {
	    path             => "${puppetboard_path}",
		options          => 'Indexes',
		custom_fragment  => "Require all granted\n    WSGIProcessGroup puppetboard\n    WSGIApplicationGroup %{GLOBAL}",
	  },
	],
    wsgi_daemon_process         => 'puppetboard',
    wsgi_daemon_process_options =>
      { processes    => '2', 
        threads      => '15',
		user         => "${puppetboard_user}",
		group        => "${puppetboard_group}",
       },
    wsgi_script_aliases         => { '/' => '/var/www/puppetboard/wsgi.py' },
  }  
  
  class { 'puppetboard':
    puppetdb_host  => 'puppet1.vag.ardemans.int',
	puppetdb_port  => '8080',
	require        => [
	  Apache::Vhost['puppetboard']
	],
  }
  
  class { 'rabbitmq':
    stomp_ensure   => true,
    config_stomp   => true,
	stomp_port     => '61613',
  }
  
  rabbitmq_user { 'mcollective':
    password       => 'marionette',
    admin          => true,
  }
  
  rabbitmq_vhost { '/mcollective':
    ensure         => present
  }
  
  rabbitmq_user_permissions { 'mcollective@/mcollective':
    configure_permission  => '.*',
	read_permission       => '.*',
	write_permission      => '.*',
  }
  
  rabbitmq_exchange { 'mcollective_broadcast@/mcollective':
    ensure                => present,
	user                  => 'mcollective',
	password              => 'marionette',
	type                  => 'topic',
  }

  rabbitmq_exchange { 'mcollective_directed@/mcollective':
    ensure                => present,
	user                  => 'mcollective',
	password              => 'marionette',
	type                  => 'direct',
  }
  
}
