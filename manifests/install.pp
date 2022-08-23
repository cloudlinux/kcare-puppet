# @author Sanket Shirode
#
# @summary This class is responsible for installing kernel care on agent nodes
#
# @example
#   include kernelcare::install
#
class kernelcare::install(
  $installation_script_url  = $kernelcare::installation_script_url,
  $installation_script_path = $kernelcare::installation_script_path,
  $patch_server             = $kernelcare::patch_server,
  $registration_url         = $kernelcare::registration_url,
  $email_id                 = $kernelcare::email_id,
) {
  wget::retrieve { 'installation script':
    source      => $installation_script_url,
    destination => "${installation_script_path}/kernelcare_install.sh",
    timeout     => 0,
    verbose     => true,
  }

  file { 'change permissions':
    ensure  => 'present',
    path    => "${installation_script_path}/kernelcare_install.sh",
    mode    => '0744',
    require => Wget::Retrieve['installation script'],
  }

  exec { 'execute installer':
    path        => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
    command     => "${installation_script_path}/kernelcare_install.sh",
    provider    => shell,
    creates     => '/etc/sysconfig/kcare/kcare.conf',
    environment => ["KCARE_PATCH_SERVER=${patch_server}","KCARE_REGISTRATION_URL=${registration_url}","KCARE_MAILTO=${email_id}"],
    logoutput   => true,
  }

}
