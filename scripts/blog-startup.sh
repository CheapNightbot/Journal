#!/bin/bash

# SCRIPT TO SETUP A NEW BLOG POST

# Define global varibales for later use.
date_short=$(date +%F)
date_full=$(date +%F\T%X)

# Work around for the file path if script not ran while inside script directory.
# Like, if you ran the script from the root of the Blog: './scripts/blog-startup.sh'.
if test -d '../content/blog/'; then
	path_to_blog='../content/blog/'
elif test -d 'content/blog/'; then
	path_to_blog='content/blog/'
else
	echo "Couldn't find the 'blog' directory within the context of your current working directory!"
	echo "Please, either change directory to the root of your zola site using 'cd' OR specify the root of your zola site below."
	read -p "Press enter to continue..." -r continue
	read -p "Enter the path to the root of your zola site: " site_root
	if test -d 'content/blog/'; then
		path_to_blog='content/blog/'
	else
		echo "Couldn't find the 'blog' directory within the context of provided path.\nPlease manually 'cd' into the root of your zola site."
		exit 1
	fi
fi

# Ask for the Blog title.
read -p "* Name / Title for the Blog: " title

# Frontmatter for the Blog post
frontmatter="""+++
title = \"$title\"
date = \"$date_full\"
[taxonomies]
    tags = [\"add_tags_here\"]
[extra]
    toc = true
+++
"""

# Replace any non-alphanumeric character with a hyphen (-) in the user provided Blog title.
# This is to prevent trying to create a file/folder with invalid characters. For example, a folder name can't contain `?` character.
title=$(sed 's/\W$//g' <<< $(sed 's/\s/\-/g' <<< $(sed 's/\W/ /g' <<< ${title,,})))

# Prepend the short date to the Blog title and create that file OR folder/directory.
filename=$date_short'-'$title

# Ask whether to create a file or folder for the new Blog post.
echo
echo "* Would you like to create a FILE or FOLDER for this Blog Post?"
echo "- Please visit this URL for more info: https://www.getzola.org/documentation/content/overview/"
echo """
1. FILE (default)
2. FOLDER
"""
read -p "Please enter 1 or 2 >>> " choice
echo

case ${choice} in
	1)
		path_of_file=$path_to_blog$filename'.md'
		touch $path_of_file
		echo "$frontmatter" > $path_of_file
		echo "'$filename.md' has been created inside '$path_to_blog'.\n"
		read -p "Would you like to open it now? [Y/N] (default: Y): " open
		case ${open,,} in
			y)
				code $path_of_file
				;;
			n)
				exit 0
				;;
			*)
				code $path_of_file
				;;
		esac
		;;
	2)
		path_of_folder=$path_to_blog$filename
		mkdir $path_of_folder && cd $_ && touch index.md
		echo "$frontmatter" > index.md
		echo "'index.md' has beed created inside '$path_of_folder'."
		read -p "Would you like to open 'index.md' now? [Y/N] (defualt: Y): " open
		case ${open,,} in
			y)
				code index.md
				;;
			n)
				exit 0
				;;
			*)
				code index.md
				;;
		esac
		;;
	*)
		echo "Going with the default option, FILE."
		path_of_file=$path_to_blog$filename'.md'
		touch $path_of_file
		echo "$frontmatter" > $path_of_file
		echo "'$filename.md' has been created inside '$path_to_blog'."
		read -p "Would you like to open it now? [Y/N] (default: Y): " open
		case ${open,,} in
			y)
				code $path_of_file
				;;
			n)
				exit 0
				;;
			*)
				code $path_of_file
				;;
		esac
		;;
esac
