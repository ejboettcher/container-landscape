# Introduction
The purpose of this repository is to provide a technology landscape evaluation with the goal of determining which container technologies can potentially run on DoD HPC systems at scale to solve data analytics workflow problems and what hardware architectures are best to support them. This includes the following container technologies for consideration: Docker, Shifter, Singularity, LXC/LXD, andpossibly others. The final list of container technologies will be determined in collaboration with the PETTT DSATA team. For each one investigated minimally list the security and system privilege requirements, describe the types of applications that can be addressed, and determine whether the technology can be deployed on current systems or requires some specialized architecture. Include other information to help differentiate the products and recommend which ones to investigate further.

## Description of Contents
Each folder will contain some basic information regarding the named technology including a DRAFT (untested) setup script for getting it up and running, an list of services required to get the container solution running, a security analysis based on the setup script software requirements.

## Background information for all technologies
### Linux Containers (LXC)
[Linux Containers or LXC](https://en.wikipedia.org/wiki/LXC) is an operating system level virtualization method for running multiple isolated Linux systems (containers) on a host using a Single Linux kernel (wikipedia).

LXC uses a variety of kernel tools such as chroot, cgroups, and namespaces to provide isolation of containers.  A limitation of LXC is that it is basically chroot on steriods so there is no system call translation which would allow running containers with a kernel other than the host systems.

While Docker originally was developed using Linux containers, it has since moved on to its own library.

### Docker
[Docker](https://en.wikipedia.org/wiki/Docker_(software)) was originally an abstraction layer ontop of LXC but has since developed its own library (libcontainer), written in Go, which requires Linux 3.8 or higher.

Running Linux containers on windows is a recent development requiring Windows 10 with Hyper-V installed.  This is done by docker by setting up a Hyper-V VM in the background and connecting to that for the container solution.

http://geekyap.blogspot.com/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html
