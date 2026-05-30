@echo off
title 創作者專用：硬碟隱形安全結界
color 0b

echo ===================================================
echo [資安防護啟動] 請選擇你要執行的安全操作：
echo ===================================================
echo.
echo    [1] 啟動結界：隱形 D 槽 (Hide Drive D)
echo    [2] 解除結界：還原 D 槽 (Show Drive D)
echo.
echo ===================================================
set /p choice="請輸入數字指令 (1 或 2) 後按 Enter: "

if "%choice%"=="1" goto HIDE
if "%choice%"=="2" goto SHOW
goto END

:HIDE
:: 修改系統登錄檔，數值 8 代表隱形 D 槽（二進位矩陣運算）
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /t REG_DWORD /d 8 /f >nul
:: 強制重啟 Windows 檔案總管讓設定立即生效，免重新開機
taskkill /f /im explorer.exe >nul
start explorer.exe
echo.
echo [安全防護] 結界已啟動！D 槽已從系統中徹底隱形。
goto END

:SHOW
:: 刪除隱形限制，還原顯示
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /f >nul
taskkill /f /im explorer.exe >nul
start explorer.exe
echo.
echo [安全防護] 結界已解除！D 槽已安全回復顯示。
goto END

:END
echo.
pause