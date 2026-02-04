@echo off
echo ========================================================
echo        Agentic Trip Planner - Deployment Script
echo ========================================================
echo.
echo This script will configure Git and push all your files to Hugging Face.
echo.

:: Initialize Git if not already done
if not exist .git (
    echo Initializing Git repository...
    git init
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
git push --force huggingface master:main

echo.
echo Deployment command finished. Check the output above for errors.
pause
