@echo off
:: ======= CONFIG SECTION =======
:: 1. Set your local project path (CHANGE THIS)
set PROJECT_PATH=C:\Users\dkrku\OneDrive\Pictures\Desktop\Source Code

:: 2. Set your GitHub repo URL (CHANGE THIS)
set REPO_URL=https://github.com/dkruban/2YEAR_Project_Note_Sphere_App.git

:: ======= START SCRIPT =======
echo.
echo 🗑️ GitHub File Delete Script Starting...

:: Move to project folder
cd /d "%PROJECT_PATH%"

:: Reset remote (in case already added)
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%

:: Stage deletion for all tracked files
echo 🔍 Finding and staging files to delete from GitHub only...
for /f "delims=" %%f in ('git ls-files') do (
    echo ❌ Removing from GitHub: %%f
    git rm --cached "%%f"
)

:: Commit the deletion
echo 📝 Committing deletion...
git commit -m "Deleted files from GitHub only - %date% %time%" >nul 2>&1

:: Set branch name safely to main
echo 🔁 Setting branch to main...
git branch -M main

:: Push changes to GitHub
echo 🚀 Pushing deletion to GitHub...
git push origin main

echo ✅ Done! Files deleted from GitHub, kept safely in local folder.
pause
