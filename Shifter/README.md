# Shifter
## Overview
![shifter implementation][shifter.png]

Shifter is a prototype implementation by NERSC at bringing containers to HPC systems.  It does this by converting docker images (and VMs and CHOS) to a common format that is scalably distributed across nodes.  Shifter allows the user to select a docker image (dockerfile) and submit a job that will run in that container.

> Shifter  is  decomposed  into
> four  major  components:  an  Image  Gateway,  command-line
> utilities,  “udiRoot”,  and  Workload  Manager  (WLM)  Integration components. The command-line utilities serve to allow a
> user to interactively manage and select images as well as ease
> environmental  translations  between  the  host-system  environment  and  the  target  UDI.  The  Image  Gateway  is  responsible
> for  managing  the  images,  keeping  a  data-store  of  presently
> loaded  images,  and  transferring  images  to  the  computational
> platforms. In the case of Docker images, the Image Gateway
> actually  communicates  with  a  local  docker  daemon  to  pull
> down an image from DockerHub or a private registry, and then
> extract  the  image  and  any  needed  metadata.  The  “udiRoot”
> component  contains  all  the  scripts  and  configurations  that
> run  on  a  compute  node  to  actually  make  the  UDI  available,
> and  to  deconstruct  it  at  the  end  of  a  job.  Workload  Manager
> integration is critical because the WLM is directly responsible
> for  determining  which  nodes  are  to  be  used,  and  thus  job
> prologue and epilogues are used to setup the UDI in the job.
> Furthermore,  the  WLM  must  provide  some  mechanism  for
> accessing the UDI in the batch job. [2][2]


* works with parallel file systems
* 
## Container technology used
Manipulations to linux Virtual File System to support a chroot environment for process execution.  All management and resource limiting is done by the scheduler. 

## Host OS requirements
Modern linux kernel

## Containerised OS capabilities
Up to and including the kernel running on the host.  Supports other linux distributions than the host.

## User workflow [3][3]
1. Create image and push to Docker Hub/ private repo
2. Tell imageGateway to pull docker image and build
3. Run sbatch and prepend `shifter` to executable

## Admin workflow
1. Setup and configure imageGateway system
2. Setup private Docker repo
3. Install udiRoot on all compute nodes

## Security overview
Shifter is still pre-release. 

The shifter executable on all compute nodes runs as setuid root.  Once an executable is launched into a container processes are stripped of all priveleges but there are several utilities that must be run as root for each image creation and destruction.

The imageGateway must run Docker.  Because some consider this a vulnerability this gateway is recommended to be separate from the HPC system, but must still communicate with the HPC system to transfer image files.

Documentation is lacking

## Licensing



[shifter.png]:https://www.nersc.gov/assets/_resampled/ResizedImage600453-shifterDiagram.png
[1]:https://cug.org/proceedings/cug2016_proceedings/includes/files/pap103.pdf
[2]:http://www.nersc.gov/assets/Uploads/cug2015udi.pdf
[3]:https://www.slideshare.net/insideHPC/shifter-containers-in-hpc-environments