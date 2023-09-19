@echo off

SET BASEPATH=%~dp0
DEL /Q /F "%BASEPATH%\..\Manifest.toml"

CALL "%JULIA_193%" --project=%BASEPATH%\.. -e "import Pkg; Pkg.test()"