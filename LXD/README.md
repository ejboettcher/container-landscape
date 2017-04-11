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
* multi guest OS support (ubuntu, debian, redhat, centos, oracle)

Supposedly can be compiled for other OS architecture (centos, redhat) but may not be fully functional.

First-party support for Go and Python API clients. Third-party support for Ruby, java, and Node.js API clients. 

LXC images have the ability to run a docker image within them which would provide the security of LXC to a docker container (no root escape concerns).

LXC containers run as the users UID so escaping the container only allows for unpriveleged access.

LXC/LXD containers are built similar to how a full virtual mahcine is, this process can leverage existing IT automation tools such as puppet/chef/ansible etc.

Possibly similar to Singularity, need to investigate whether a user can configure a container.  In other words, is root access on the host required to get container root (for configuration/installation of software)?

[1]:https://www.ubuntu.com/containers/lxd
