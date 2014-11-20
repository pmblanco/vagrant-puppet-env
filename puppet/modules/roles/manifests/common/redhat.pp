class roles::common::redhat {
  
  class {'epel':
  }

  class {'remi':
    php55_enabled   => '1',
  }
  
  class { 'repoforge':
  }
  
}
