# == Class splunkforwarder::install
#
# This class is called from splunkforwarder for install.
#
class splunkforwarder::install(
  $package_name     = $::splunkforwarder::package_name,
  $package_ensure   = $::splunkforwarder::package_ensure,
  $package_source   = $::splunkforwarder::source_root,
  ) {
  package { $package_name:
    ensure   => $package_ensure,
    source   => "/tmp/${package_name}.rpm",
    provider => 'rpm',
  }
}
