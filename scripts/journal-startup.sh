#!/bin/bash

# SCRIPT TO CREATE A NEW ENTRY FOR JOURNAL

date_short=$(date +%F)
date_full=$(date +%F\T%T)

content="\n<article data-date=\"$date_short\">\n\n## {{ date_format(date=\"$date_short\") }} :EMOJI: {#$date_short}\n> {{ date_format_journal(date=\"$date_full\") }}\n\n- \n\n</article>"

# Work around for the file path if script not ran while inside script directory.
# Like, if you ran the script from the root of the Blog: './scripts/journal-startup.sh'.
if [[ -f ../content/_index.md ]]; then
	journal='../content/_index.md'
elif [[ -f content/_index.md ]]; then
	journal='content/_index.md'
else
	echo "Couldn't find the '_index.md' within the context of your current working directory!"
	echo "Please, either change directory to the root of your zola site using 'cd' OR specify the root of your zola site below."
	read -p "Press enter to continue..." -r continue
	read -p "Enter the path to the root of your zola site: " site_root
	if [[ -f $site_root'/content/_index.md' ]]; then
		journal=$site_root'/content/_index.md'
	else
		echo "Couldn't find the '_index.md' within the context of provided path.\nPlease manually 'cd' into the root of your zola site."
		exit 1
	fi
fi

sed -i '/<!-- NEW POST ON TOP -->/a\'"$content" $journal

echo "Added new entry for $date_short in Journal"
read -p "Would you like to open it? [Y/N] (default: Y): " open

case ${open,,} in
	y)
		code $journal
		;;
	n)
		exit 0
		;;
	*)
		code $journal
		;;
esac
