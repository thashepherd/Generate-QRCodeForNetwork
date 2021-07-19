# Summary

This is a simple Powershell Core script which generates and displays a QR code that connects users to the network you're currently connected to.

Optionally, you can use the script to generate a QR code for an arbitrary network.

There are no parameters.

I wrote this script to help guests easily connect to my home WiFi network, to connect my phone to coffee shop networks I'd already connected my laptop to, etc. In other words, laziness :).

# Dependencies

This (very small) script is built around [TobiasPSP's QRCodeGenerator module](https://github.com/TobiasPSP/Modules.QRCodeGenerator).

# Requirements

Powershell Core (6+) is required. This script will not function on legacy Powershell (5 and below) due to the use of the `-Raw` parameter with `Select-String` (although that could likely be rewritten with a few minutes' work).
