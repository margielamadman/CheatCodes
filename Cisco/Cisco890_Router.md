# Cisco 890 Router Upgrade Guide

***Plug in serial cable to console port and ethernet cable to Fast Ethernet port 0***

---

## After First Boot

### Skip the system configuration dialog

`Would you like to enter the initial configuration dialog? [yes/no]: no`

### Enable privileged commands

`Router> enable`

### Check the current system version

`Router# show version`

## Configure VLAN

### Assign the default VLAN an IP address and subnet mask

```vendor
Router# configure terminal
Router(config)# ip default-gateway 10.0.0.1
Router(config)# interface vlan 1
Router(config-if)# ip address 10.0.0.2 255.255.255.0
Router(config-if)# no shutdown
Router(config-if)# end
```

The Fast Ethernet ports are automatically configured as part of the default VLAN. `no shutdown` enables the Ethernet interface, bringing it up.

### Test the connection

`Router# ping 10.0.0.4`

## Upgrade the ROM Monitor

### Download the new rommon using SCP

```vendor
Router# copy scp: flash:
Address or name of remote host []? 10.0.0.4
Source username [Router]? pi
Source filename []? /srv/tftp/C890_RM2.srec.124-22r.YB5
Destination filename [C890_RM2.srec.124-22r.YB5]?
Password:
```

### Run the upgrade command

```vendor
Router# upgrade rom-monitor file flash:C890_RM2.srec.124-22r.YB5
This command will result in a  'power-on reset' of the router!
Continue? [yes/no]: yes
System configuration has been modified. Save? [yes/no]: yes
```

The router will reboot after this.

### Check the installation

`Router> show rom-monitor`

Towards the bottom of the output it should say the following:

```vendor
Currently running ROMMON from Upgrade region
ROMMON from Upgrade region is selected for next boot
```

## Download the new IOS image

### Clear some space for the new image

`Router# delete flash:<old-image>`

Only delete old images that are not being used as the boot image.
Do not delete the boot image before you install the newer one.
If the image is expanded into a directory you can delete the
directory recursively using:

`Router# delete /force /recursive flash:<old-image>`

### Download the new IOS image using SCP

```vendor
Router# copy scp: flash:
Address or name of remote host []? 10.0.0.4
Source username [Router]? pi
Source filename []? /srv/tftp/c890-universalk9-mz.158-3.M2.bin
Destination filename [c890-universalk9-mz.158-3.M2.bin]?
Password:
```

## Install the new IOS image

```vendor
Router# configure terminal
Router(config)# no boot system
Router(config)# boot system flash:c890-universalk9-mz.158-3.M2.bin
Route(config)# end
Router# write memory
```

Here we are specifying the system image the router loads at startup.
We first remove the previous setting using `no` then we set the new
image. `write memory` saves the new boot setting.

You can make sure the setting was set correctly using:

`Router# show running-config | include boot system`

Delete the old image:

`Router# delete flash:<old-image>`

Finally reload the router:

`Router# reload`

## Post Install

### Check installed image

`Router# show version | include System image`

### Reset configuration

`Router# write erase`

---

## Troubleshooting

---

### Booting to ROM monitor and no image is in flash directory

---

#### Download IOS image from TFTP server

```vendor
rommon x> IP_ADDRESS=10.0.0.2
rommon x> IP_SUBNET_MASK=255.255.255.0
rommon x> DEFAULT_GATEWAY=10.0.0.1
rommon x> TFTP_SERVER=10.0.0.4
rommon x> TFTP_FILE=c890-universalk9-mz.158-3.M2.bin
rommon x> tftpdnld
Do you wish to continue? y/n:  [n]: y
rommon x> boot flash:<filename>
```

Use the "set" command to view the variables you just set.

---

### Configuring what mode the router boots into

---

#### Configure the router to boot up in ROM monitor mode

```vendor
Router>
Router# enable
Router# configure terminal
Router(config)# config-register 0x0
Router(config)# exit
Router# reload
System configuration has been modified. Save? [yes/no]: no
Proceed with reload? [confirm]
```

As long as the config-reg value is 0x0, you will have to manually
boot the opertaing system from the rommon.

#### Configure the router to boot into the IOS image stored in flash

```vendor
rommon x> confreg 0x2101
rommon x> boot
```

After the next reset or power-cycle, the config-reg will change and the router will
always boot into the IOS image.
