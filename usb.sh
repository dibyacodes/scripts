echo "Utils.shhhhh"

echo "

--- Options Menu ---

Key	Operation

1	Create a bootable drive
2	Format a drive
3	Install virtual machine (Quemu/KVM)
"

echo "Choose : "
read userChoice

if ((userChoice == 1));then
    echo "ISO file (location to the .iso file) : "
    read isoFile

    echo "

    Here's a list of the drive clinged into the device

    "
    lsblk

    echo "What is the location of the drive? (Eg : /dev/sda) : "
    read flashDrive

    sudo dd if=/home/dibyacodes/$isoFile of=$flashDrive bs=4M status=progress oflag=sync
fi 


if ((userChoice == 3));then
    echo "Installing quemu/kvm"

    sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

    echo "

    Enabling libvirtd

    "

    sudo systemctl enable --now libvirtd

    echo "
    Adding you $USER to the libvirt group"

    sudo usermod -a -G libvirt $USER
    newgrp libvirt 

    echo "
    Launching virt-manager"

    virt-manager
fi 
