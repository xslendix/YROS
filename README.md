<h1 align="center">Yet another Robot Operating System</h1>

This project utilizes [Buildroot](https://buildroot.org/) to create a fast, portable installation for [yrosd](https://github.com/xslendix/yrosd).

## Building

```
make rpi3_64-gui
# OR
make rpi4_64-gui
```

## Known bugs

 * rpi4 build includes the rpi3 config.txt file. The file needs to be manually replaced after each flashed.

