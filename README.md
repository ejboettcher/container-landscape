# Introduction
The purpose of this repository is to provide a technology landscape evaluation with the goal of determining which container technologies can potentially run on DoD HPC systems at scale to solve data analytics workflow problems and what hardware architectures are best to support them. This includes the following container technologies for consideration: LXD, OpenStack, Shifter, and Singularity.  In addition to these some preliminary research went into technologies similar to OpenStack (RedHat's OpenShift, Kubernetes) but these technologies suffer from the same problem as Openstack, they were not developed to support HPC hardware and workloads.  Of particular concern is their reliance on a more general purpose workload manager which do not work well with typical HPC workload managers.

The final list of container technologies will be determined in collaboration with the PETTT DSATA team. For each technology investigated we will minimally list the security and system privilege requirements, describe the types of applications that can be addressed, and determine whether the technology can be deployed on current systems or requires some specialized architecture. Include other information to help differentiate the products and recommend which ones to investigate further.

## Description of Contents
Each folder will contain some basic information regarding the named technology including a commented setup.sh script, a README.md file that will outline the technology and any additional documents or files useful for demonstrating the technology.

Each Readme.md contains the following:
* Overview
* Container technology used
* Host OS requirements
* Containerised OS capabilities
* User workflow
* Admin workflow
* Security overview
* License


## Background information for all technologies
### Linux Containers (LXC)
[Linux Containers or LXC](https://en.wikipedia.org/wiki/LXC) is an operating system level virtualization method for running multiple isolated Linux systems (containers) on a host using a Single Linux kernel (wikipedia).

LXC uses a variety of kernel tools such as [chroot][chroot], [cgroups][cgroups], and [namespaces][namespaces] to provide isolation of containers.

### Docker
[Docker](https://en.wikipedia.org/wiki/Docker_(software)) was originally an abstraction layer ontop of LXC but has since developed its own library (libcontainer), written in Go, which requires Linux 3.8 or higher.

Running Linux containers on windows is a recent development requiring Windows 10 with Hyper-V installed.  This is done by docker by setting up a Hyper-V VM in the background and connecting to that for the container solution.

[cgroups]:https://en.wikipedia.org/wiki/Cgroups
[namespaces]:https://en.wikipedia.org/wiki/Linux_namespaces
[chroot]:https://en.wikipedia.org/wiki/Chroot

## Comparison of technologies
Some information found during a cursory review of container technologies ruled out several technologies.  Among these, Docker Swarm, Kubernetes, OpenShift, and OpenStack all do not support workload managers/schedulers beyond their own included basic scheduler.  In addition to this several of these (OpenStack, Docker Swarm) require many additional daemons running with elevated priveleges running on the compute nodes in order to be managed/scheduled.

There are several comparisons of the remaining technologies (Shifter and Singularity) in current media [1][comparison].  Shifter and Singularity have several similarities in that both are developed for HPC systems exclusively, and both seek to allow for the end users to utilize more popular container technologies (Docker) locally and provide an interface to transfer those images for use on a HPC system.  A typical user workflow would be very similar under both of these approaches with the only significant differences being in the docker image conversion software used.




[comparison]:http://geekyap.blogspot.ch/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html
