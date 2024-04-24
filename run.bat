set name=automated_metashape

cd %~dp0
CALL conda activate %name%
CALL sphinx-build . ./_build/html -b html
robocopy ./slides/ ./_build/html/slides /MIR
CALL ghp-import -n -p -f _build/html
CALL conda env export -n %name% > %name%.yaml
