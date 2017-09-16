# Deepdream vagrant template

This repository contains vagrant template for initializing and running a VM to try out Google research's [deep dream](https://github.com/google/deepdream) project. The python notebook has been customized to the vm's environment.

To get started:
- make sure you have [vagrant](https://www.vagrantup.com/downloads.html) installed.
- Install the latest version of [virtual box](https://www.virtualbox.org/wiki/Downloads).

After cloning this repository run: `vagrant up`.
This should take care of downloading the vm and installing all the dependencies such as numpy, scipy, caffe/etc..

Once vagrant is done setting up your vm, enter vm using `vagrant ssh` and run 
```
jupyter notebook
``` 
from the home directory. You should see something like this:

```
ubuntu@caffe-ml:~$ jupyter notebook
[W 04:12:07.584 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 04:12:07.593 NotebookApp] Serving notebooks from local directory: /home/ubuntu
[I 04:12:07.594 NotebookApp] 0 active kernels
[I 04:12:07.594 NotebookApp] The Jupyter Notebook is running at: http://0.0.0.0:8000/
```

From your host machine open http://localhost:8080/notebooks/dream.ipynb

Have fun deeeeeeep dreaming !