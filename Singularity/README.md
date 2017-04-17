## Singularity
### Overview
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
* better documentation on using singularity containers on HPC
* [singularityhub][https://singularity-hub.org/faq]

Singularity also provides a custom container implementation utilizing standard LXC features like namespaces with some custom tweaks for running in a HPC environment.  To use these features the host OS needs to be running a linux kernel newer than 2.6.25, and again can run any guest OS inside the container that uses a kernel up to and including that of the host.

### User workflow
1. Create image somewhere the user has root/admin rights
2. Interact and configure image locally
3. Upload image to HPC
4. Start image in scheduler batch script
5. Execute user code on container

### Admin workflow
1. Install Singularity on HPC system
2. Provide place for image creation
3. Provide sample base images for each system

### Security overview
Security paradigm remains mostly intact.  No additional root priveleges given.  User requires root/admin priveleges on system where the image is being configured (can be done locally if user has priveleges).

### Licensing
Free, copyright owned by Gregory Kurtzer / Lawrence Berkeley National Laboratory

[Singularity.jpg]:https://6lli539m39y3hpkelqsm3c2fg-wpengine.netdna-ssl.com/wp-content/uploads/2016/10/Singularity-architecture_G-Kurtzer-e1477021972985.jpg
[1]:http://singularity.lbl.gov/
[2]:http://www.admin-magazine.com/HPC/Articles/Singularity-A-Container-for-HPC
[usage1]:https://researchapps.github.io/reproducibility/physics/2016/11/17/singularity-hello-world/
[usage2]:https://hpc.nih.gov/apps/singularity.html
[comparison]:http://geekyap.blogspot.ch/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html
[github]:https://github.com/singularityware/singularity
