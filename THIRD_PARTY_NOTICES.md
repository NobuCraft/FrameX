# Third-party notices — FrameX 3.0.0

FrameX code is MIT-licensed; dependencies retain their own licenses. FrameX is not affiliated with Intel, NVIDIA, Microsoft or Discord.

## PresentMon 2.3.1 x64 (unmodified)

- Intel Corporation / GameTechDev contributors; MIT.
- License: `_internal/tools/PresentMon-LICENSE.txt` in a binary install, `tools/PresentMon-LICENSE.txt` in source.
- Release: https://github.com/GameTechDev/PresentMon/releases/tag/v2.3.1
- Download: https://github.com/GameTechDev/PresentMon/releases/download/v2.3.1/PresentMon-2.3.1-x64.exe
- Bundled as PresentMon.exe, 421312 bytes.
- SHA-256: `364e5d98d4d134bd54dd25c22ed2ca2f4883f8bc3ed6502bee0c151e3436d30c`.

FrameX checks this hash before capture. No executable updates are downloaded automatically. A hash is not independent publisher-signature verification.

## Bundled runtime

Exact runtime/build versions are recorded in `licenses/VERSIONS.txt` of the installed application.

- CPython 3.11.9 / tkinter: PSF license and historical notices, `licenses/CPython-LICENSE.txt`.
- Tcl/Tk 8.6: BSD-style license, `licenses/Tcl-license.terms` and `licenses/tk8.6-license.terms`.
- Pillow 12.3.0: Pillow/HPND and bundled third-party notices, `licenses/Pillow-LICENSE`.
- psutil 7.2.2: BSD-3-Clause, `licenses/psutil-LICENSE`.
- pystray 0.19.5: LGPL-3.0, `licenses/pystray-COPYING.LGPL` and `licenses/pystray-COPYING`.
- six 1.17.0: MIT, `licenses/six-LICENSE`.
- nvidia-ml-py 13.615.71: NVIDIA BSD-3-Clause notice, `licenses/NVIDIA-NVML-LICENSE.txt`.
- OpenSSL 3.0.13: Apache-2.0, `licenses/OpenSSL-LICENSE.txt`.
- libffi and Microsoft redistributable runtime: applicable notices/restrictions included in CPython's license file. Microsoft runtime components are supplied for use on Windows, not under FrameX's MIT license.
- PyInstaller 6.22.3 bootloader: GPL-2.0 with the distribution exception, `licenses/pyinstaller-COPYING.txt`. PyInstaller itself is a build-time tool, not required on the user's computer.
- NSIS 3.11 installer stub/plugins: applicable notices in `licenses/NSIS-copyright.txt` (upstream notices as supplied by Debian's NSIS package).

### LGPL replaceability / pystray source

The unmodified pystray package is shipped as ordinary `.py` source files in `_internal/pystray`, outside the PyInstaller PYZ archive. You may inspect, modify or replace these library files with a compatible version for your own use; FrameX does not prohibit reverse engineering for debugging modifications to the LGPL library. Keep the copyright/license notices and comply with LGPL when redistributing. FrameX's small backend subclass is in `framex/tray.py` in the accompanying MIT source archive.

Pinned upstream source: https://github.com/moses-palmer/pystray/tree/v0.19.5 . Build instructions and the application source are supplied separately as `FrameX-3.0.0-source.zip`; they are not required to run the installed EXE.

## Icon artwork

Installed paths below start in `_internal/`; source paths start at the project root.

- Lucide SVGs: https://github.com/lucide-icons/lucide/tree/main/icons . ISC plus inherited Feather MIT notices: `assets/icons/LUCIDE-LICENSE.txt`.
- Genuine Discord mark via Simple Icons: https://github.com/simple-icons/simple-icons/blob/develop/icons/discord.svg . CC0 1.0 text: `assets/icons/SIMPLE-ICONS-LICENSE.txt`. Discord trademark rights remain with their owners; this does not imply affiliation or endorsement.
- SVG source files and pre-rendered PNGs are included. CairoSVG was used only for asset preparation; no network requests or CairoSVG installation are needed at runtime.
- FrameX F mark is original application branding rendered locally; no external icon fonts are downloaded.
