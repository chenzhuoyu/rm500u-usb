# RM500U-CN USB Driver Patch

1. Patch the option driver for your current kernel version.

If this script does not work, look at the source and figure out why on your own.

```bash
./patchsrc.sh
```

2. Build the driver.

Assuming you have a working build environment.

```bash
make
```

3. Install & load the driver.

Assuming the builtin `option` driver is not loaded. Ensure this on your own.

```bash
sudo make install
sudo modprobe option
```

