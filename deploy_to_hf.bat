@echo off
setlocal enabledelayedexpansion
echo ========================================================
echo        Agentic Trip Planner - Deployment Script (v2)
echo ========================================================
echo.

:: Initialize Git if not already done
if not exist .git (
    echo Initializing Git repository...
    git init
)

:: Set dummy git config if not set (needed for commit)
git config user.email >nul 2>&1
if %errorlevel% neq 0 (
    echo Setting temporary Git identity...
    git config user.email "deploy@example.com"
    git config user.name "Deployment Agent"
)

:: Ensure we are on a branch called 'main'
echo Configuring branch...
git checkout -b main 2>nul
if %errorlevel% neq 0 (
    git branch -m main 2>nul
)

:: Add all files
echo Adding files to Git...
git add .

:: Commit
echo Committing changes...
git commit -m "Full deployment from local machine"

:: Add Remote (ignore error if already exists)
echo Configuring remote...
git remote remove huggingface 2>nul
git remote add huggingface https://huggingface.co/spaces/Rahii123/AI_Trip_Planner

:: Push
echo.
echo ========================================================
echo READY TO PUSH
echo.
echo You will be asked for credentials.
echo verify Username: Rahii123
echo verify Password: [YOUR HUGGING FACE ACCESS TOKEN]
echo ========================================================
echo.

:: Detect current branch and push to main on HF
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%a
echo Pushing branch !CURRENT_BRANCH! to Hugging Face main...
git push --force huggingface !CURRENT_BRANCH!:main

echo.
if %errorlevel% neq 0 (
    echo [ERROR] Push failed. Please check your token and internet connection.
) else (
    echo [SUCCESS] Push complete! Check your Space at:
    echo https://huggingface.co/spaces/Rahii123/AI_Trip_Planner
)
echo.
pause
