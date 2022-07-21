lang en_US
keyboard us
timezone America/Los_Angeles --isUtc
rootpw $2b$10$k/1YQDiG96z1.dGhoBcRw.8d3bu7/ptyDIkJ9ZqgwlmMt8enErUe. --iscrypted
#platform x86_64
text
cdrom
bootloader --append="rhgb quiet crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M"
zerombr
clearpart --all --initlabel
autopart
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --enabled --ssh
skipx
firstboot --disable
network  --bootproto=dhcp --device=ens192 --ipv6=dhcp --activate
network  --hostname=alma-8-amd64.oak02.bloudraak.net
services --enabled=NetworkManager,sshd
reboot --eject

%packages --ignoremissing --excludedocs
openssh-clients
curl
dnf-utils
drpm
net-tools
open-vm-tools
perl
perl-File-Temp
sudo
vim
wget
python3

# unnecessary firmware
-aic94xx-firmware
-atmel-firmware
-b43-openfwwf
-bfa-firmware
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
-iwl*-firmware
-libertas-usb8388-firmware
-ql*-firmware
-rt61pci-firmware
-rt73usb-firmware
-xorg-x11-drv-ati-firmware
-zd1211-firmware
-cockpit
-quota
-alsa-*
-fprintd-pam
-intltool
-microcode_ctl
%end

%post
sed -i 's/^#?PermitRootLogin \(without-password\|forced-commands-only\|prohibit-password\|no\|yes\)/PermitRootLogin yes/' /etc/ssh/sshd_config

systemctl enable vmtoolsd
systemctl start vmtoolsd
%end
