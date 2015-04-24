class profiles::eci_common::ubuntu {
  
  class { 'apt':
    disable_keys  => true,
  }

}
