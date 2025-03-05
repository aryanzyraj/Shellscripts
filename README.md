gh auth login
git init
git add .
git remote add origin https://github.com/aryanzyraj/Shellscripts.git

git commit -m "Initial commit"
git branch -M main
git push -u origin main

Follow these steps to upload your project to GitHub:

git init

git add .

git commit -m "Add all my files"

git remote add origin https://github.com/yourusername/your-repo-name.git

Upload of the project from scratch requires git pull origin master.

git pull origin master

git push origin master

If any problem occurs in pushing, use git push --force origin master.
