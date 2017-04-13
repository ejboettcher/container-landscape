# LXD
## Overview
LXD is a canonical software package that bills itself as a "container hypervisor".  [From LXD canonical website][1], current benefits include:
* security by default over LXC (with AppArmor, user namespaces, SECCOMP)
* Bare-metal performance
* Easy monitoring of guest processes
* Easy sharing of hardware resources
* Precise quality of service and quotas
* snaphsots and live migration
* support for multiple cpu arch (arm, power, x86, z)
* RESTful API with CLI
* Rapid provisioning, instant boot
* remote image services

While sharing a considerable amount with conventional LXC, the Canonical LXD allows for instances of most other linux distributions to be ran without a traditional hypervisor.  In addition to this LXD provides an HTTPS OpenStack interface and a local command line tool for interacting with these containers.

Supposedly can be compiled for other OS architecture (centos, redhat) but may not be fully functional.

First-party support for Go and Python API clients. Third-party support for Ruby, java, and Node.js API clients. 

LXC images have the ability to run a docker image within them which would provide the security of LXC to a docker container (no root escape concerns).

LXC/LXD containers are built similar to how a full virtual machine is, this process can leverage existing IT automation tools such as puppet/chef/ansible etc.[2][2]

## Container technology used
LXD utilizes LXC container technology.

## Host OS requirements
Since it is developed by Canonical, LXD works best on Ubuntu systems.  Experimental support for compiling on CentOS exists but may not be fully functional.
LXC is a part of the linux Kernel and should be supported on most systems.

## Containerised OS capabilities
LCD supports the following containerised OS's: 
* Ubuntu
* Debian
* RedHat
* Centos
* Oracle Linux

## User workflow
Potential user workflow:
1. Develop container image from base to allow compilation/execution of software
2. Deploy image locally or on test server (depending on ease of deploying LXC container on local OS)
3. Test software in container
4. Submit container to private repository in use on HPC
5. Submit batch job starting container, exectuing code, and stopping contiainer on completion

Notes on user workflow: Installing anything locally will likely require admin/root priveleges.  Having a designated place to build containers (perhaps on the login node) is recommended.

The ability to test a container locally would require docker or a virtual machine to be installed if the user is runnign a Windows OS.

## Admin workflow
Potential admin workflow:
1. Configure LXC/LXD on HPC
2. Configure private repository for HPC
3. Configure scheduler to not allow continued execution of container after job finishes (useful feature)
4. Approval process for submissions to private repository may be necessary

## Security and Usability overview
Being the most low level of the container technologies and most mature, LXC will provide the most security and isolation for a users container.  Given that escalation of priveleges inside the container does not grant elevated priveleges on the host make this approach very isolated and actually may increase security on a multiuser environment.

Containers can created, ran, and destroyed all with an unpriveleged (non root) account by default.

To take advantage of all of the security available with LXD a modern linux kernel that supports cgroup namespaces will be required (4.4+)

Usability is not very high with this approach.  Lacking any Windows support and requiring most of the work being done by the user to setup, maintain, and run the container may be too ambitious.

## Licensing
Free software under Apache 2 license.  Commercial support for LXD on Ubuntu LTS provided by Canonical.

[1]:https://www.ubuntu.com/containers/lxd
[2]:https://oliverveits.wordpress.com/2016/09/11/lxd-vs-docker-or-getting-started-with-lxd-containers/