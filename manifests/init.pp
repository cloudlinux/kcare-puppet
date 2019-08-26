# @author Sanket Shirode
#
# @summary This class is responsible for specifying the entrypoint and the sequence in which classes 
#          Should be executed
#
# @example
#   include kernelcare
#
# @param config_hash
#   Defines parameters for the configuration file
# @param patch_server
#   Defines address of the eportal server 
# @param registration_url
#   Defines server registration api for eportal
# @param email_id
#   Defines email id for kcare
# @param registration_key
#   Defines the registration key used by servers for registering to eportal
# @param  autoupdate
#   Defines the autoupdate parameter for config file
# @param execute_patch
#   Defines whether to run the patch command on server or not
# @param execute_unpatch
#   Defines whether to run the unpatch command on server or not
# @param execute_check
#   Defines whether to run the check command on server or not
# @param servertag
#   Defines a tag name for the server
# @param installation_script_path
#   Defines download path for the installaion script on servers
# @param installation_script_url
#   Defines url for downloading installation script
#
class kernelcare(
  Hash $config_hash = {},
  Optional[String] $patch_server = undef,
  Optional[String] $registration_url = undef,
  Optional[String] $email_id = undef,
  Optional[String] $registration_key = undef,
  Boolean $autoupdate = true,
  Boolean $execute_patch = false,
  Boolean $execute_unpatch = false,
  Boolean $execute_check = false,
  Optional[String] $servertag = undef,
  Optional[String] $installation_script_path = '/tmp',
  Optional[String] $installation_script_url  = 'https://repo.cloudlinux.com/kernelcare/kernelcare_install.sh',
) {
  include wget
  include kernelcare::install
  include kernelcare::register
  include kernelcare::config
  include kernelcare::service
  include kernelcare::commands

  Class['kernelcare::install']
  -> Class['kernelcare::config']
  -> Class['kernelcare::service']
  -> Class['kernelcare::register']
  -> Class['kernelcare::commands']
}
