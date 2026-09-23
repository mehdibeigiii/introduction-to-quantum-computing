#!/usr/bin/env bash
set -euo pipefail

usage() { echo "Usage: bash scripts/setup.sh [--with-dwave]" >&2; exit 2; }
if [[ $# -gt 1 ]] || { [[ $# -eq 1 ]] && [[ $1 != --with-dwave ]]; }; then usage; fi
with_dwave=false
if [[ $# -eq 1 ]]; then with_dwave=true; fi

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
cd "$repo_root"
if ! command -v python3.13 >/dev/null 2>&1; then
  echo "Python 3.13 is required. Install it, then rerun this command." >&2
  exit 1
fi
python3.13 - <<'PY'
import platform
import sys

system, machine = platform.system(), platform.machine()
if system == "Darwin" and machine == "arm64":
    if int(platform.mac_ver()[0].split(".")[0]) < 14:
        sys.exit("macOS 14 or newer is required for the pinned wheels.")
elif system == "Linux" and machine == "x86_64":
    library, version = platform.libc_ver()
    if library != "glibc" or tuple(map(int, version.split(".")[:2])) < (2, 28):
        sys.exit("Linux x86_64 with glibc 2.28 or newer is required.")
else:
    sys.exit("Supported platforms: macOS Apple Silicon and Linux x86_64 (glibc 2.28+).")
PY

venv="$repo_root/.venv"
env_python="$venv/bin/python"
if [[ -L $venv ]]; then
  echo "Existing .venv is a symlink; refusing to use it. Move it aside and rerun." >&2
  exit 1
fi
if [[ ! -e $venv ]]; then
  python3.13 -m venv "$venv"
elif [[ ! -f $venv/pyvenv.cfg || ! -x $env_python ]]; then
  echo "Existing .venv is incomplete. Move it aside and rerun; nothing was removed." >&2
  exit 1
fi

"$env_python" - "$venv" <<'PY'
from pathlib import Path
import sys

expected = Path(sys.argv[1]).resolve()
if (sys.version_info[:2] != (3, 13) or
        Path(sys.prefix).resolve() != expected or
        sys.prefix == sys.base_prefix):
    sys.exit("Existing .venv is incompatible with this repository. Move it aside and rerun.")
PY
if ! "$env_python" -m pip --version >/dev/null 2>&1; then
  echo "Existing .venv has no working pip. Move it aside and rerun." >&2
  exit 1
fi

export PIP_REQUIRE_VIRTUALENV=1
"$env_python" -m pip install --only-binary=:all: \
  --index-url https://download.pytorch.org/whl/cpu torch==2.11.0
"$env_python" -m pip install --only-binary=:all: -r requirements.txt
if $with_dwave; then
  "$env_python" -m pip install --only-binary=:all: -r requirements-dwave.txt
fi
"$env_python" -m pip check
"$env_python" -m ipykernel install --prefix "$venv" \
  --name introduction-to-quantum-computing \
  --display-name "Python (Introduction to Quantum Computing)"
"$env_python" - "$venv" <<'PY'
from pathlib import Path
import importlib.metadata as metadata
import json
import sys

venv = Path(sys.argv[1]).resolve()
python = (venv / "bin/python").resolve()
spec = venv / "share/jupyter/kernels/introduction-to-quantum-computing/kernel.json"
if Path(json.loads(spec.read_text())["argv"][0]).resolve() != python:
    sys.exit("Kernel verification failed: its interpreter is outside .venv.")
for package in ("pip", "jupyterlab", "qiskit", "numpy", "torch"):
    location = Path(metadata.distribution(package).locate_file("")).resolve()
    if not location.is_relative_to(venv):
        sys.exit(f"Package {package} is outside .venv: {location}")
print(f"Setup verified in {venv}")
PY
echo "Start JupyterLab: .venv/bin/python -m jupyterlab"
