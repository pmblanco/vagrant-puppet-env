class eciprofiles::nodejs {

  class { '::nodejs':
    make_install => false,
  }

}

