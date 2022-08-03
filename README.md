
# kernelcare

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with kernelcare](#setup)
    * [What kernelcare affects](#what-kernelcare-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with kernelcare](#beginning-with-kernelcare)
3. [Usage - Configuration options and additional functionality](#usage)


## Description
The kernelcare module installs, configures, and manages kernelcare to update your kernel without rebooting the server. It also registers the server to kernelcare eportal using the license key provided to module.
This module installs kernelcare using script and manages configuration using the puppet template. It also provides option to execute various kernelcare commands on servers.


## Setup

### What kernelcare affects

This module manage the kernelcare configuration file (**/etc/sysconfig/kcare/kcare.conf**) as well as the kernelcare service(**kcare**). It is also responsible for managing the server registry file(**/etc/sysconfig/kcare/systemid**)

### Setup Requirements

This module requires following puppet modules from the forge:
(Dependencies)
1. **rehan-wget** (>=1.3.4 < 2.0.0)
2. **puppetlabs-stdlib** (>= 5.0.0 < 7.0.0)

### Beginning with kernelcare

To begin with kernelcare, place it in the modules directory on puppet master. 

To change the configuration add settings to config hash in hiera. The hiera file(**common.yaml**) is present in modules data directory. 

For registering the servers to eportal it is needed to update the hiera values for patch server and registration url as per the eportal in your environment.


After completing all the above mentioned steps apply the module to servers.

## Usage

This module can be used for installation, configuration and management of kernelcare. It can also be used for registering servers to eportal and execute kernelcare commands on the servers.

## Reference

### Classes
  * kernelcare::install: Installs kernelcare on servers
  * kernelcare::config: Configures kernelcare on servers
  * kernelcare::service: Manages kernelcare service
  * kernelcare::register: Registers server to eportal
  * kernelcare::commands: Executes commands on the servers

### Define
  * kernelcare::execute_command_define: Accepts command for execution on servers

### Parameters

  **config_hash**

    Defines parameters for the configuration file

  **patch_server**

    Defines address of the eportal server 

  **registration_url**

    Defines server registration api for eportal

  **email_id**

    Defines email id for kcare

  **registration_key**

    Defines the registration key used by servers for registering to eportal

  **autoupdate**

    Defines the autoupdate parameter for config file

  **execute_patch**

    Defines whether to run the patch command on server or not

  **execute_unpatch**

    Defines whether to run the unpatch command on server or not

  **execute_check**

    Defines whether to run the check command on server or not

  **execute_tag**

    Defines whether to run the tag command on server or not

  **servertag**

    Defines a tag name for the server

  **installation_script_path**

    Defines download path for the installaion script on servers

  **installation_script_url**

    Defines url for downloading installation script

