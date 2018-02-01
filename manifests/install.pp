class stunnel::install inherits stunnel {

  if($stunnel::manage_package)
  {
    package { $stunnel::params::package_name:
      ensure => $stunnel::package_ensure,
    }
  }

}
