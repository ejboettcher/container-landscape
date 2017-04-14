# OpenStack
## Overview
Openstack is a cloud computing software platform designed for controlling large pools of compute, storage, and networking resources.  While making large inroads in the private cloud community, utilizing openstack for HPC purposes is still in its infancy. [1][1] [2][2].  The primary reason for this is Openstack's reliance on typical IP networking and more generalized scheduler, which combine to make 

## Container technology used
Can use Docker, LXC, RKT, and traditionaly VMs.

## Host OS requirements
Multiple linux systems required to manage all of the moving parts.

## Containerised OS capabilities
Most any traditional OS (including windows if you use the true hyperviser and run it in a VM).

## User workflow
Likely website frontend.
May not work with popular HPC schedulers.

## Admin workflow
Significantly complicated setup of OpenStack system

## Security overview
Many moving parts and using in with an HPC system would require significant development and would likely fall outside the scope of this project due to resources issues.  

## License
Free released under Apache license.

[1]:https://www.openstack.org/assets/science/OpenStack-CloudandHPC6x9Booklet-v4-online.pdf
[2]:https://www.openstack.org/videos/vancouver-2015/openstack-in-hpc-operations-a-campus-perspective
