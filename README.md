# qnx-boot-script-kaitai-struct

This is a QNX boot script parser for Kaitai Struct. It is capable of parsing the '.script' files used in the startup process of the QNX operating system.

Specifically, this parser has been tested against a QNX 6.5.0 boot script.

## Usage

Simply upload the script to the [Kaitai Struct web IDE](https://ide.kaitai.io/) along with your .script file for parsing.

## Example Parsing Output

TODO: Add example screenshot

## TODO Items / Known Issues

Currently, entry type 0x05 (extended scheduler) is unhandled - it is simply dumped into a string.

Unknown/unhandled entries are also currently dumped into a string.
