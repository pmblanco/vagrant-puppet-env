class eciprofiles::common::ubuntu {
  
  class { 'apt':
    disable_keys  => true,
  }

}
