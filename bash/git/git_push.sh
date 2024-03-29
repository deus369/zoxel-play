#! /bin/bash

source bash/git/git_check_user.sh
source bash/git/git_add_ssh.sh
echo "Inside Directory [$PWD]" # should be zoxel directory
echo "-> Getting modified or updated git files."
modified_and_new_files="$(git ls-files --modified --others --exclude-standard)"
if [ -z "$modified_and_new_files" ]; then
	echo ""
	echo "========================="
	echo "-> No files have been updated."
	echo ""
	echo ""
	echo "========================="
	echo ""
	git push # -u origin master
	# sleep 6
	exit
else
	# echo "Files have been modified or added."
	echo ""
	echo "========================="
	echo ""
	echo "-> Modified:"
	git ls-files --modified
	echo ""
	echo "-> New:"
	git ls-files --others --exclude-standard
	echo ""
	echo "========================="
	echo ""
	# echo $modified_and_new_files
	# sleep 1
fi

echo "-> Enter your commit message"
read commitmsg # get commit message off user
echo "	- Commit message is [$commitmsg]"
git add -A	# add all files to staged list
git commit -m "$commitmsg"	# create commit
echo "	- Created commit."
git push # -u origin master
echo Finished Git Push