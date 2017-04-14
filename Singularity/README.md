# Singularity
## Overview
Note: this is the Lawrence Berkley National Lab Singularity software available [here][1].  There is another software package called Singularity which is a Apache Mesos framework for scheduling Docker containers which can cause a lot of confusion when researching.

Singularity offers some big advantages over many traditional container solutions because it was designed for the specific purpose of mobility of compute on HPC systems.
![singularity overview][Singularity.jpg]

Benefits of Singularity:
* mobility of compute
* start/stop containers without root
* image based containers
* user cannot become root inside container (requires root outside container)
* no root daemon owned processes
* can import docker containers
* supports any scheduler
* supports GPU
* better documentation on using singularity containers on HPC

## Container technology used
Custom, likely utilizes LXC with some custom tweaks (uses primarily namespaces)

## Host OS requirements
Modern linux kernel (2.6.25+)

## Containerised OS capabilities
Up to and including the kernel running on the host.  Supports other linux distributions than the host.

## User workflow
1. Create image somewhere the user has root/admin rights
2. Interact and configure image locally
3. Upload image to HPC
4. Start image in scheduler batch script
5. Execute user code on container

## Admin workflow
1. Install Singularity on HPC system
2. Provide place for image creation
3. Provide sample base images for each system

## Security overview


## Licensing
Free, copyright owned by Gregory Kurtzer / Lawrence Berkeley National Laboratory

[Singularity.jpg]:https://6lli539m39y3hpkelqsm3c2fg-wpengine.netdna-ssl.com/wp-content/uploads/2016/10/Singularity-architecture_G-Kurtzer-e1477021972985.jpg
[1]:http://singularity.lbl.gov/
[2]:http://www.admin-magazine.com/HPC/Articles/Singularity-A-Container-for-HPC
[usage1]:https://researchapps.github.io/reproducibility/physics/2016/11/17/singularity-hello-world/
[usage2]:https://hpc.nih.gov/apps/singularity.html
[comparison]:http://geekyap.blogspot.ch/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html