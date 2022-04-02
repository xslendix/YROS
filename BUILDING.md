# Building

This document assumes that you are using a GNU/Linux enviroment. If you are running on Windows, WSL or a VM should work.

## Prerequisites

### Fedora

```
sudo dnf install texinfo binutils-devel curl cmake mpfr-devel libmpc-devel gmp-devel patch @"C Development Tools and Libraries" git
```

### openSUSE

```
sudo zypper install curl cmake mpfr-devel mpc-devel gmp-devel patch gcc gcc-c++ patterns-devel-C-C++-devel_C_C++ git
```

### Void Linux

```
sudo xbps-install -S base-devel cmake curl mpfr-devel libmpc-devel gmp-devel git
```

### ALT Linux

```
apt-get install curl cmake libmpc-devel gmp-devel libmpfr-devel patch git
```

## Cloning the repository

```
git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/xslendix/yros.git
cd yros
```

Since this project uses buildroot as a submodule, `--recurse-submodules` is required. The repositories are also shallow cloned so it doesn't take too much time just to get everything downloaded.

## Starting a build

### With GUI:
```
make rpi3_64-gui
# OR
make rpi4_64-gui
```

### Without GUI (headless) (not yet available):
```
make rpi3_64-nogui
# OR
make rpi4_64-nogui
```

A typical build on my machine takes ~2 hours. Of course, for you it may take longer or less, so be sure to have something to do while you're waiting.

## Flashing the image

The output image file can be found at `buildroot/output/images.img`.
