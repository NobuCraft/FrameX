# Build with Windows Python x64: python -m PyInstaller --noconfirm --clean FrameX.spec
from pathlib import Path
from PyInstaller.utils.hooks import collect_submodules

base=Path(SPECPATH)
a=Analysis([str(base/'main.py')],pathex=[str(base)],binaries=[],
    datas=[(str(base/'assets'),'assets'),(str(base/'tools'),'tools')],
    hiddenimports=['pynvml']+collect_submodules('pystray')+collect_submodules('PIL'),
    hookspath=[],runtime_hooks=[],excludes=['pytest','numpy','matplotlib','pandas'],
    # LGPL library is an ordinary, replaceable Python package outside the PYZ.
    module_collection_mode={'pystray':'py'},noarchive=False)
pyz=PYZ(a.pure)
exe=EXE(pyz,a.scripts,[],exclude_binaries=True,name='FrameX',debug=False,
    bootloader_ignore_signals=False,strip=False,upx=False,console=False,
    disable_windowed_traceback=False,icon=str(base/'assets'/'FrameX.ico'),
    version=str(base/'installer'/'version.txt'),uac_admin=False)
coll=COLLECT(exe,a.binaries,a.datas,strip=False,upx=False,name='FrameX')
