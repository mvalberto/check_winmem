@echo off
cd C:\Program Files\NSClient++\scripts\
start RAMRush.exe "-AutoOptimize"
ping -n 30 127.0.0.1 > nul
taskkill -IM RamRush.exe /F
