# Virtual Environments and Packages

## Versions

* python2 uses virtualenv
* python3 uses venv

## Python 3

### Install pip3 on ubuntu

`$ sudo apt install python3-pip`

### Update pip

`$ python3 -m pip install --user --upgrade pip`

### Create virtual environment

`$ python3 -m venv env`

### Activate the virtual environment

`$ source /env/bin/activate`

### Update pip in venv

`$ pip install -U pip`

### requirements.txt

Use a requirements.txt file to keep track of packages
and to install them in one command:

`$ pip install -r requirements.txt`
