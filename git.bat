@echo off
:: ======= CONFIG SECTION =======
:: Set your local project path here
set PROJECT_PATH= C:\Users\dkrku\OneDrive\Pictures\Desktop\netcat-win32-1.11

:: Set your GitHub repo URL here
set REPO_URL=https://github.com/dkruban/netcat

:: ======= MAIN SCRIPT =======
echo.
echo 🚀 Starting Git Auto Upload Script...
cd /d "%PROJECT_PATH%"

echo 🔄 Initializing Git (if needed)...
git init

echo 🔗 Setting remote origin...
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%

echo 📦 Adding files...
git add .

echo 📝 Committing changes...
git commit -m "Auto-uploaded on %date% %time%" >nul 2>&1

echo 🚀 Pushing to GitHub...
git push -u origin master || git push -u origin main

echo ✅ Upload Completed Successfully!
pause
