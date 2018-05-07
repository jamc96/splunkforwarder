# Class: splunkforwarder
# ===========================
#
# Full description of class splunkforwarder here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'splunkforwarder':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class splunkforwarder (
  String $package_name        = 'splunkforwarder',
  String $package_ensure      = 'present',
  String $user                = 'splunk',
  String $port                = '9997',
  String $server              = 'splunkforwarder',
  String $version             = '6.5.1',
  String $local_server        = $::hostname,
  String $home_dir            = '/opt/splunkforwarder',
  String $config_dir          = "${home_dir}/etc/system/local",
  String $run_dir             = "${home_dir}/var/run",
  String $log_dir             = "${home_dir}/var/log/splunk",
  String $config_ensure       = 'present',
  String $service_name        = 'splunk',
  String $service_ensure      = 'running',
  String $web_name            = 'splunkweb',
  String $database            = '/home/build/build-home/ivory/var/lib/splunk',
  Boolean $enable_db          = false,
  String $log_files           = ['audit','btool','conf','splunkd','metrics','splunkd_access','mongod','scheduler']
  ){
  # module containment
  contain ::splunkforwarder::install
  contain ::splunkforwarder::config
  contain ::splunkforwarder::service
  # module relationship
  Class['::splunkforwarder::install']
  -> Class['::splunkforwarder::config']
  ~> Class['::splunkforwarder::service']
}
