# Introduction
The purpose of this repository is to provide a technology landscape evaluation with the goal of determining which container technologies can potentially run on DoD HPC systems at scale to solve data analytics workflow problems and what hardware architectures are best to support them. This includes the following container technologies for consideration: Kubernetes, LXD, OpenShift, OpenStack, Shifter, and Singularity. The final list of container technologies will be determined in collaboration with the PETTT DSATA team. For each technology investigated minimally list the security and system privilege requirements, describe the types of applications that can be addressed, and determine whether the technology can be deployed on current systems or requires some specialized architecture. Include other information to help differentiate the products and recommend which ones to investigate further.

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

While Docker originally was developed using Linux containers, it has since added additional features via its own library.

### Docker
[Docker](https://en.wikipedia.org/wiki/Docker_(software)) was originally an abstraction layer ontop of LXC but has since developed its own library (libcontainer), written in Go, which requires Linux 3.8 or higher.

Running Linux containers on windows is a recent development requiring Windows 10 with Hyper-V installed.  This is done by docker by setting up a Hyper-V VM in the background and connecting to that for the container solution.

http://geekyap.blogspot.com/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html

[cgroups]:https://en.wikipedia.org/wiki/Cgroups
[namespaces]:https://en.wikipedia.org/wiki/Linux_namespaces
[chroot]:https://en.wikipedia.org/wiki/Chroot