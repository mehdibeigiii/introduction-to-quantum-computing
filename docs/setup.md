# Local setup

Use Python 3.13 on macOS Apple Silicon (macOS 14 or newer) or Linux x86_64
with glibc 2.28 or newer. Windows and Intel Macs are not covered by this setup.
You also need internet access for the pinned package wheels. From the
repository root:

```bash
bash scripts/setup.sh
.venv/bin/python -m jupyterlab
```

For optional D-Wave hardware packages, run:

```bash
bash scripts/setup.sh --with-dwave
```

This only installs software inside `.venv`; it does not configure an account
or submit a job. Consult [D-Wave's Ocean instructions](https://docs.dwavequantum.com/en/latest/ocean/install.html)
before enabling the hardware flag in MaxCut. IBM hardware use likewise
requires your own account and an explicit notebook flag. Local simulation
does not require either account.

## Troubleshooting

- If `python3.13` is missing, install Python 3.13 and rerun the command.
- If setup rejects an existing `.venv`, move that directory aside and rerun.
  The script never deletes or repairs it implicitly.
- If pip reports an unavailable wheel, confirm the Python/platform
  prerequisites and network access. Do not install into system Python.
- To inspect the installation, run `.venv/bin/python -m pip check` and
  `.venv/bin/python -c 'import sys; print(sys.prefix)'`. The printed prefix
  should end in this repository's `.venv`.
- If JupyterLab does not list the kernel, rerun setup and restart JupyterLab.
