# Device Tree for Realme Narzo N53 (RMX3761)

## Device specifications

| Feature                 | Specification                                                   |
|------------------------|----------------------------------------------------------------|
| Chipset                | Unisoc T612 (12 nm)                                            |
| CPU                    | Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)       |
| GPU                    | Mali-G57                                                        |
| Memory                 | 4/6/8 GB RAM                                                    |
| Storage               | 64/128 GB                                                       |
| Battery               | 5000 mAh                                                        |
| Dimensions            | 165.7 x 76.1 x 7.9 mm                                          |
| Display               | 6.74" IPS LCD, 90Hz, 720 x 1600 pixels                         |
| Rear Camera           | 50 MP (Main) + 2 MP (Depth)                                    |
| Front Camera          | 8 MP                                                           |
| Release Date          | 2023, July                                                     |

## Device Image

![Realme N53 (RMX3761)](https://static.c.realme.com/IN/wm-thread/1661013678612295680.jpg)


## Features

- [x] Audio
- [x] Camera
- [x] Display
- [x] GPS
- [x] Wi-Fi
- [x] Bluetooth
- [x] FM Radio
- [x] Sensors
- [x] A/B Partitions Support
- [x] Virtual A/B Support

## HALs Implementation

- Audio HAL (v7.1)
- Camera Provider HAL (v2.6)
- Graphics HAL (v4.0)
- Health HAL (v2.1)
- Keymaster HAL (v4.1)
- Light HAL (v2.0)
- Power HAL (v2.1)
- Thermal HAL (v2.0)

## Building

```bash
# Set up build environment
source build/envsetup.sh

# Choose your build target
lunch lineage_RMX3761-userdebug

# Build the ROM
mka bacon
```

## Required Blobs

All proprietary blobs are extracted from stock firmware. See `proprietary-files.txt` for the complete list.

## Kernel

The device uses a Unisoc T612 kernel with the following configurations:
- Architecture: arm64
- Defconfig: RMX3761_defconfig
- Compiler: Clang

## SELinux Status

The device tree implements enforcing SELinux policies with custom rules for:
- Camera HAL
- Fingerprint HAL
- Power HAL
- Thermal HAL

## Credits

Special thanks to:
- Realme/OPPO for releasing kernel sources
- LineageOS team for the base device tree structure
- Unisoc for platform support

## Contributing

If you want to contribute to this device tree:
1. Fork the project
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This device tree is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
