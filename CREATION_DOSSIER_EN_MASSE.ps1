@echo off
for /f "tokens=*" %%x in (structure.txt) do (mkdir "%%x")