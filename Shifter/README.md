# Shifter
## Overview
Shifter is a prototype implementation by NERSC at bringing containers to HPC systems.  It does this by converting docker images (and VMs and CHOS) to a common format that is scalably distributed across nodes.  Shifter allows the user to select a docker image (dockerfile) and submit a job that will run in that container.
![shifter implementation][shifter.png]

> Shifter  is  decomposed  into
> four  major  components:  an  Image  Gateway,  command-line
> utilities,  “udiRoot”,  and  Workload  Manager  (WLM)  Integra-
> tion components. The command-line utilities serve to allow a
> user to interactively manage and select images as well as ease
> environmental  translations  between  the  host-system  environ-
> ment  and  the  target  UDI.  The  Image  Gateway  is  responsible
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
## Host OS requirements
## Containerised OS capabilities
## User workflow
## Admin workflow
## Security overview
## Licensing



[shifter.png]:https://www.nersc.gov/assets/_resampled/ResizedImage600453-shifterDiagram.png
[1]:https://cug.org/proceedings/cug2016_proceedings/includes/files/pap103.pdf
[2]:http://www.nersc.gov/assets/Uploads/cug2015udi.pdf