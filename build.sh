PYTHONOPTIMIZE=2 pyinstaller check.py --clean -F --noconfirm
rm build -r
rm __pycache__ -r
rm check.spec
