# Build your own Arch disk
 - Uses Archiso 
 - Aur Cutom repo builder
 - Cow size resizer
 - Makefile


ISO SEP-15-2017
=============================================================================
ISO download link for those who do not have Arch Linux, or cannot run build.
Link: https://drive.google.com/file/d/0B_GjH5bNX6kbQmN4LUZxckFjMU0/view?usp=sharing

Notable ISO packages, includes AUR packages
=============================================================================

   * Desktop
     - Lightdm ( enabled )
     - XFCE4
     - i3
   * Browsers
     - chromium
     - firefox
     - midori
   * Dev tools
     - vim
     - Visual Studio Code [Removed from GIT build]
     - git
     - base-devel
   * Themes
     - Paper icons
     - Arc gtk themes
   * System
     - Linux Kernel 4.12.13-1
     - Gparted
     - Pacaur & Yaourt [Pacaur removed from GIT build]
     - TLP ( enabled )
     - sudo

RUNNING BUILDS
=============================================================================
 * Basic Requirement stuff:
  - Arch Linux install 64-bit
  - Have all required dependencies installed, including the archiso package.
  - Have at least 5G of free disk space for a minimal build environment. 10G
    recommended.
  - You the builder will want a virtual environment to test the ISOs,
    ex: Virtualbox, QEMU, VMware, etc.
  - A CPU with reliable voltages and reliable heat transfer.
-----------------------------------------------------------------------------
 * Basic Customization stuff:
  - Makefile build is a shortcut for .`/setup_path.sh && sudo ./build.sh -v`
  - Makefile clean is a shortcut for `sudo rm -r ./work`
  - Packages can be added to or removed from packages.x86_64
  - Users can be added through the file airootfs/root/customize_airootfs.sh
  - Services and configs can also be written through
    airootfs/root/customize_airootfs.sh
  - Temporary filesystem size [cow size] can be modified with `./cowsize.sh`
    - ex: `./cowsize.sh 1G` for 1 gigabyte of ramdisk when booted.
-----------------------------------------------------------------------------
 * Aur Packages Setup:
  - Run `./yes_build_aur.sh` to run git+makepkg on all packages in ./aur_git.links and makes custom repo. Also adds custom repo to ./pacman.conf.
  - Add Aur packages to be installed to package list ./packages.x86_64.
 * Disabling or Removing Aur Packages:
  - Run `./no_aur.sh` to disable Aur in ./pacman.conf
  - Run `./clean_aur.sh` to remove custom repo folder.
 * Re-Enabling Aur Packages:
  - Run `./yes_aur.sh` to enable Aur custom repo in ./pacman.conf.
-----------------------------------------------------------------------------
 * If archiso/releng script breaks from a script update ( booting ISO breaks
    at waiting for disk by id ).
  - Newer scripts can be copied from /usr/share/archiso/configs/releng.
  - Delete ./airootfs/etc/systemd/system/getty@tty1.service.d/
     because autologin is not wanted.
  - Two files, airootfs/root/customize_airootfs.sh and the file packages.x86_64 have relevant
    configuration information.
  - `cp -r /usr/share/archiso/configs/releng/ ./ && rm -r ./airootfs/etc/systemd/system/getty@tty1.service.d/`
-----------------------------------------------------------------------------
 * Video series I watched that helped me learn how to use the archiso builds.
  - Part 1: https://youtu.be/DqV1BJtJXEA
  - Part 2: https://youtu.be/uAwkYpgg-0M
  - Part 3: https://youtu.be/n71KQjownSI
  - Part 4: https://youtu.be/sOaZe5jUdPU
 * If you add "-i" to /usr/bin/mkarchiso's pacstrap, do not forget to use -v
  when running builds from ./build.sh. The '-v' verbose argument is required
  to use with pacstrap's '-i' interactive mode, or the archiso build will
  stall.
-----------------------------------------------------------------------------
WARNING: Compressing the disk is highly taxing on the CPU, recommend not running builds on unstable CPUs.
-----------------------------------------------------------------------------
Those at risk of overheating or otherwise.
-----------------------------------------------------------------------------
