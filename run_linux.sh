#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
python3 -c 'import sys; assert sys.version_info >= (3,10), "Python 3.10+ required"'
if ! python3 -c 'import tkinter' 2>/dev/null; then
  echo 'Install tkinter first (Ubuntu/Debian: sudo apt install python3-tk python3-venv).'
  exit 1
fi
if [[ ! -x .venv/bin/python ]]; then python3 -m venv .venv; fi
if [[ ! -f .venv/requirements-installed.txt ]] || ! cmp -s requirements.txt .venv/requirements-installed.txt; then
  .venv/bin/python -m pip install -r requirements.txt
  cp requirements.txt .venv/requirements-installed.txt
fi
echo 'Linux mode: system sensors only. PresentMon FPS capture requires Windows.'
exec .venv/bin/python main.py
