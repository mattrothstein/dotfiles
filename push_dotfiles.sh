#git add, commit and push dot files
cd ~ && env -i git add -f .zshrc && env -i git add -f .pryrc && env -i git add -f .bash_profile && env -i git add -f .vimrc && env -i git add -f push_dotfiles.sh && env -i git commit -m "weekly update" && git push origin master
