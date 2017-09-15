=============================================================================
==   ____                    _               ____        _ _     _         == 
==  |  _ \ _   _ _ __  _ __ (_)_ __   __ _  | __ ) _   _(_) | __| |___     ==   
==  | |_) | | | | '_ \| '_ \| | '_ \ / _` | |  _ \| | | | | |/ _` / __|    == 
==  |  _ <| |_| | | | | | | | | | | | (_| | | |_) | |_| | | | (_| \__ \    ==   
==  |_| \_\\__,_|_| |_|_| |_|_|_| |_|\__, | |____/ \__,_|_|_|\__,_|___/    ==   
==                                   |___/                                 ==
=============================================================================
=============================================================================
WARNING: Compressing the lzma portion is highly taxing on the CPU, 
  recommended not to run builds on unstable CPUs. Those at risk of
  overheating or otherwise.
=============================================================================
 * Basic requirement stuff:
  > Have all required dependencies installed, including the archiso package.
  > Have at least 5G of free disk space for a minimal build environment. 10G
    recommended.
  > You the builder will want a virtual environment to test the ISOs, 
    ex: Virtualbox, QEMU, VMware, etc.
  > A CPU with reliable voltages and reliable heat transfer.
-----------------------------------------------------------------------------
 * Basic explanation stuff:
  > Makefile build is a shortcut for sudo ./build.sh -v 
  > Makefile clean is a shortcut for sudo rm -r ./work
  > Packages can be added to or removed from packages.x86_64
  > Users can be added through the file airootfs/root/customize_airootfs.sh
  > Services and comfigs can also be written through
    airootfs/root/customize_airootfs.sh
-----------------------------------------------------------------------------
 * Aur Packages Setup:
  > End result: A designated folder with <package>.pkg.tar.xz package files,
    that is usable as a custom repo in last three lines of ./pacman.conf.
  > Fully update the system
  > Make a folder to store the custom repo ( "mkdir aur_repo" )
  -- Repeat for each wanted Aur package --
    > cd to a temporary directory ex: /tmp
    > git clone a wanted package to the temp directory
    > cd into the cloned package's directory 
    > run "makepkg -s" to build the PKGBUILD
    > mv or cp the file ending with .pkg.tar.xz to your designated Aur folder.
  -- End --
  > cd to designated aur folder
  > run "repo-add ./custom.db.tar.gz ./*" to build the custom repo
  > Set the "Server = " line in ./pacman.conf to point to your new custom repo,
    absalute paths are simplest.
  > Add aur packages to be installed to packages.x86_64, package name does not 
    require version number, ex: yaourt-1.9-1-any.pkg.tar.xz is just "yaourt"
-----------------------------------------------------------------------------
 * If archiso/releng script breaks from a script update ( booting iso breaks
    at waiting for disk by id ).
  > Newer scripts can be copied from /usr/share/archiso/configs/releng.
  > Three files, airootfs/root/customize_airootfs.sh, last three lines of
    pacman.conf and the file packages.x86_64 have relevant 
    configuration information.
-----------------------------------------------------------------------------
 * Video series I watched that helped me learn how to use the archiso builds.
  > Part 1: https://youtu.be/DqV1BJtJXEA
  > Part 2: https://youtu.be/uAwkYpgg-0M
  > Part 3: https://youtu.be/n71KQjownSI
  > Part 4: https://youtu.be/sOaZe5jUdPU
 * If you add "-i" to /usr/bin/mkarchiso's pacstrap, do not forget to use -v
  when running builds from ./build.sh. The '-v' verbose argument is required 
  to use with pacstrap's '-i' interactive mode, or the archiso build will 
  stall.
=============================================================================