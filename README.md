# FauxSX Docker

## Goals
A docker image with OS X-compatible versions of several shell scripting tools,
for experimentation/development/debugging on Linux. Because the OS X versions
are sufficiently different from the GNU versions that cross-platform script
development can be surprising.

This is not a substitute for testing on a real Mac - Circle, Github Actions, etc
all have OS X runners - but it can make it easier to do quick local-env
explorations.

## Binaries list

### Big Sur / MacOS 11.1
| Name | In image? | Version | Image source | OS X source |
| ----- | -------- | ------- | ------------ | --- |
| sed | No | BSD / Unknown, man page dated 2017-03-27 | | https://opensource.apple.com/source/text_cmds/text_cmds-106/sed |
| grep | No | (BSD grep) 2.5.1-FreeBSD | | https://opensource.apple.com/source/text_cmds/text_cmds-106/grep/ |
| tar | No | bsdtar 3.3.2 - libarchive 3.3.2 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.6 | | https://opensource.apple.com/source/libarchive/libarchive-83.40.4/ |
| awk | No | `awk -version` reports awk version 20200816 | | https://opensource.apple.com/source/awk/awk-27.40.1/ |
| find | No | BSD / Unknown, man page dated 2011-09-28 | | https://opensource.apple.com/source/shell_cmds/shell_cmds-216.60.1/find/ |
