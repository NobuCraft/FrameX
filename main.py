"""Desktop entry point; import-safe for PyInstaller and tests."""
import sys


def main():
    try:
        from framex.app import main as run
        run()
    except Exception:
        import traceback
        from pathlib import Path
        text = traceback.format_exc()
        sys.stderr.write(text) if sys.stderr else None
        try:
            from framex.core import CONFIG_DIR
            CONFIG_DIR.mkdir(parents=True, exist_ok=True)
            log = CONFIG_DIR / "crash.log"
            log.write_text(text, encoding="utf-8")
        except Exception:
            log = Path("crash.log")
        try:
            import tkinter as tk
            from tkinter import messagebox
            root = tk.Tk()
            root.withdraw()
            messagebox.showerror("FrameX", f"Ошибка запуска.\nПодробности: {log}\n\n{text[-900:]}")
            root.destroy()
        except Exception:
            pass
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
