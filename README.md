# BUILD DOTOS11 FOR A001D

<p align="center">
<img src="https://raw.githubusercontent.com/DotOS/resources_drawables/master/dot11/dot_main-banner.png" > 
</p>

Downloading Source Code:
========================

To initialize your local repository, use a command like this:

```bash
repo init -u git://github.com/DotOS/manifest.git -b dot11
```

Then to sync up:
================

```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

If you get permission errors, type:
================

```bash
sudo chmod 777 /etc/.repo_gitconfig.json
```

Downloading Device Trees:
========================
```bash
git clone https://github.com/jhonnytech90/android_device_asus_A001D -b dotOS device/asus/A001D &&
git clone https://github.com/jhonnytech90/vendor_asus_A001D -b lineage-18.1 vendor/asus/A001D &&
git clone https://github.com/jhonnytech90/kernel_asus_A001D -b 11 kernel/asus/A001D
```


Compilation of DotOS:
====================

From root directory of Project, perform following commands in terminal to start Compilation.


```bash
source build/envsetup.sh
lunch dot_A001D-userdebug
make bacon -J8
```
-----------------------------------------------------------------------------
