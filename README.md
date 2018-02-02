# Build your own Arch disk
 - Uses Archiso
 - Aur local repo builder
 - Cow size resizer
 - Makefile


ISO SEP-15-2017
=============================================================================
ISO download link of a build for those who do not have Arch Linux, or cannot run build.
Link: https://drive.google.com/file/d/0B_GjH5bNX6kbQmN4LUZxckFjMU0/view?usp=sharing

Notable ISO packages, includes AUR packages
=============================================================================

   * Desktop
     - Lightdm ( enabled )
     - XFCE4
     - i3
   * Browser
     - firefox
   * Dev tools
     - vim
     - git
     - base-devel
   * Themes
     - Paper icons
     - Arc gtk themes
   * System
     - Linux Kernel 4.12.13-1
     - Gparted
     - Yaourt
     - TLP ( enabled )
     - sudo

RUNNING BUILDS
=============================================================================

### Build Requirements:
  - Arch Linux x86_64-bit
  - Have all required dependencies installed, including the archiso package.
  - Have at least 5G of free disk space for a minimal build environment. 10G
  recommended.
  - Builder will want a virtual environment to test ISOs,
    * ex: Virtualbox, QEMU, VMware.
-----------------------------------------------------------------------------
### Customizing:
  - Makefile build is a shortcut for .`sudo ./build.sh -v`
  - Makefile clean is a shortcut for `sudo rm -r ./work`
  - Packages can be added to or removed from packages.x86_64
  - Users can be added through the file airootfs/root/customize_airootfs.sh
  - Services and configs can also be written through
    airootfs/root/customize_airootfs.sh
  - Temporary filesystem size [cow size] can be modified with `./cowsize.sh`
    - ex: `./cowsize.sh 1G` for 1 gigabyte of ramdisk when booted.
-----------------------------------------------------------------------------
### Aur Packages:
  - Place .git links for packages in `aur_git.links`
  - Run `./yes_build_aur.sh` to assemble the packages.
   * Adds custom repo to Archiso's pacman.conf.
   * Fetches AUR_BUILDER from github.
   * Fetches all packages from `aur_git.links`
   * Builds the packages.
   * Adds packages to local custom repo.
   * Moves custom repo to Archiso build directory.


 * Disabling or Removing AUR Packages:
  - Running `./no_aur.sh`:
    * Restores `pacman.conf.bak`.
    * Removes custom packages from `packages.x86_64`.
  - Running `./clean_aur.sh` removes local repo folder.
 * Re-Enabling Aur Packages:
  - Running `./yes_aur.sh` enables local repo in ./pacman.conf.
-----------------------------------------------------------------------------
  #### Fix Archiso break ( booting ISO breaks at waiting for disk by id )
  - Newer scripts can be copied from /usr/share/archiso/configs/releng.
  - Delete ./airootfs/etc/systemd/system/getty@tty1.service.d/
   because autologin is not wanted.
  - Two files, airootfs/root/customize_airootfs.sh and the file packages.x86_64 have relevant
  configuration information.
  - `cp -r /usr/share/archiso/configs/releng/ ./ && rm -r ./airootfs/etc/systemd/system/getty@tty1.service.d/`
  - Get GIT customizations `curl https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/airootfs/root/customize_airootfs.sh > ./airootfs/root/customize_airootfs.sh`
  - Get GIT package lists `curl https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/packages.x86_64 > packages.x86_64 && curl https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/packages.both > packages.both`
-----------------------------------------------------------------------------
### Video series I watched that helped me learn how to use the archiso builds.
  >- Part 1: https://youtu.be/DqV1BJtJXEA
  >- Part 2: https://youtu.be/uAwkYpgg-0M
  >- Part 3: https://youtu.be/n71KQjownSI
  >- Part 4: https://youtu.be/sOaZe5jUdPU
 * If you add "-i" to /usr/bin/mkarchiso's pacstrap, do not forget to use -v
  when running builds from ./build.sh. The '-v' verbose argument is required
  to use with pacstrap's '-i' interactive mode, or the archiso build will
  stall.
-----------------------------------------------------------------------------
WARNING: Compressing the disk is highly taxing on the CPU, recommend not running builds on unstable CPUs.
-----------------------------------------------------------------------------
Those at risk of overheating or otherwise.
-----------------------------------------------------------------------------
