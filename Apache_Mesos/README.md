Apache Mesos detailed info can be found here: http://mesos.apache.org/documentation/latest/architecture/

Apache Mesos provides performance Isolation between jobs (framework executors) running on compute nodes via linux containers (chroot on steroids) and [solaris zones](https://en.wikipedia.org/wiki/Solaris_Containers) linux containers with the added benefit of system call translation for certain systems.

