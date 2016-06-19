# Using the DIY Transparency Report Application

## Installation

The DIY Transparency Report App ("app") is easiest to run in a virtual machine on the end user’s computer. The app can also run on a web server. This guide outlines how to set up the app on the end user’s own computer. 

NOTE: As this is alpha software, the installation process is more complicated than polished, full releases. There are several pieces of software that need to be installed before attempting to install the app. Furthermore, the command line is used to start up the application.

The following process has been tested on Macintosh computers running the El Capitan operating system.

### Software Requirements

Please install (or update to the latest version) these applications and tools in the listed order:

1. Virtual Box (https://www.virtualbox.org)

2. Vagrant (https://www.vagrantup.com)

3. Vagrant plugins (install via command line (NOTE:  Text in bold denotes a command to run in the end user’s command line utility)):

    1. Hosts updater: **vagrant plugin install vagrant-hostsupdater** (

    2. VB Guest: **vagrant plugin install vagrant-vbguest**

4. Ansible ([http://docs.ansible.com/ansible/intro_installation.html](http://docs.ansible.com/ansible/intro_installation.html))

    3. On Macs, Ansible is easiest to install using Homebrew ([http://brew.sh/](http://brew.sh/))

        1. Run: **brew install ansible**

5. Setuptools for Python: **pip install --upgrade setuptools --user python**

6. Optional: Git (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Installing DIY Transparency Report

Once the above requirements are met, follow the below steps in order.

1. Download the files required to set up the app’s virtual machine using Vagrant as well as the Ansible playbook used for automatically configuring the vagrant machine.

    1. The installation files can be found here: [https://github.com/andrewhilts/diy-transparency](https://github.com/andrewhilts/diy-transparency)

    2. The simplest way to obtain these files is using git: **git clone **[https://github.com/andrewhilts/diy-transparency](https://github.com/andrewhilts/diy-transparency). You can also simply download a zip file from the project page.

2. In the terminal, **cd **into the downloaded project’s directory. You can have a look at the VagrantFile and change the virtual machine name or IP address if you wish.

2. Then, make two directories, "code-api" and "code-frontend".

3. In the "group_vars" folder, edit “all” on lines 7 and 11 to change the passwords for your database to your own passwords.

4. Then, run **vagrant up**.

    3. You may be asked to enter your administrator password (this is to set up a line in your hosts file so you can access the app at [http://diy-transparency.local](http://diy-transparency.local))

5. Sit back, and let vagrant and ansible setup the app for you.

Once installation has completed, navigate to http://diy-transparency.local in your browser and start using the app!

NOTE: If you need to pause the virtual machine, run **vagrant suspend** from the project directory. Simply run **vagrant up** again to bring the app back online. You’ll have to do the latter after every reboot of the end user’s machine.

