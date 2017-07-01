# BassTuner

A simple MIDI-based bass guitar tuning note generator for Windows 7 and newer. It 
was originally released at http://zetacentauri.com and was downloaded more than 
50,000 times before being open-sourced.

The goal with this application was to create the simplest bass guitar tuning note
generator possible. It only supports standard tuning and works with 4, 5, and
6-string basses.

![BassTuner Screenshot](https://github.com/Xangis/BassTuner/blob/master/images/BassTuner1.02.png)

A prebuilt Windows installer is in the installer directory here:

https://github.com/Xangis/BassTuner/blob/master/installer/BassTuner1.02Setup.exe

For the same app, but for guitar, see here:

https://github.com/Xangis/GuitarTuner

The source code is licensed under the MIT license. See the LICENSE file for details.

## Building

The only dependency Bass Tuner has is the Windows SDK. It uses the Windows MIDI
system to generate its tuning notes. It should build without any changes if you
have that.

A Visual Studio solution is included as BassTuner.sln.

## Changelog

#### 1.02

- Enabled close button.
- Added Visual Studio redistributable to installer so users won't have to hunt for it if
they don't have it yet.

#### 1.01

- Created Windows installer

#### 1.0

- Initial Release

## Development Status

I consider Bass Tuner to be a finished application and am not actively developing it.
However, I do still maintain it and will likely update it if necessary as new versions
of Windows are released.
