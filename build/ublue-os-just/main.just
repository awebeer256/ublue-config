default:
    @just --unstable --list
    
bios:
  systemctl reboot --firmware-setup

changelogs:
  rpm-ostree db diff --changelogs

distrobox-opensuse:
  echo 'Creating openSUSE distrobox ...'
  distrobox create --image quay.io/toolbx-images/opensuse-toolbox:tumbleweed -n opensuse -Y
 
distrobox-ubuntu:
  echo 'Creating Ubuntu distrobox ...'
  distrobox create --image quay.io/toolbx-images/ubuntu-toolbox:22.04 -n ubuntu -Y

enroll-secure-boot-key:
    sudo mokutil --import /etc/pki/akmods/certs/akmods-ublue.der
 
update:
  rpm-ostree update
  flatpak update -y
  distrobox upgrade -a

fixscreenshare:
  cp /usr/share/applications/org.kde.xwaylandvideobridge.desktop $HOME/.config/autostart/
  
