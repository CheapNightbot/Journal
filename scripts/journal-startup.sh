#!/bin/bash

# SCRIPT TO CREATE A NEW ENTRY FOR JOURNAL

date_short=$(date +%F)
date_full=$(date +%F\T%X)

content="\n## {{ date_format(date=\"$date_short\") }} :EMOJI:\n> {{ date_format_journal(date=\"$date_full\") }}\n\n- "

# Work around for the file path if script not ran while inside script directory.
# Like, if you ran the script from the root of the Blog: './scripts/journal-startup.sh'.
if [[ -f ../content/journal.md ]]; then
	en_journal='../content/journal.md'
	jp_journal='../content/journal.jp.md'
elif [[ -f content/journal.md ]]; then
	en_journal='content/journal.md'
	jp_journal='content/journal.jp.md'
else
	echo "Couldn't find the 'journal.md' within the context of your current working directory!"
	echo "Please, either change directory to the root of your zola site using 'cd' OR specify the root of your zola site below."
	read -p "Press enter to continue..." -r continue
	read -p "Enter the path to the root of your zola site: " site_root
	if [[ -f $site_root'/content/journal.md' ]]; then
		en_journal=$site_root'/content/journal.md'
		jp_journal=$site_root'/content/journal.jp.md'
	else
		echo "Couldn't find the 'journal.md' within the context of provided path.\nPlease manually 'cd' into the root of your zola site."
		exit 1
	fi
fi

sed -i '/<!-- NEW POST ON TOP -->/a\'"$content" $en_journal $jp_journal

echo "Added new entry for $date_short in Journal"
read -p "Would you like to open it? [Y/N] (default: Y): " open

case ${open,,} in
	y)
		echo "Remember there are two 'journal' files. It's going to open the default (English) one first and then the second (Japanese) one."
		read -p "Press enter to continue.."
		vim $en_journal
		sleep 1
		echo "Opening the second file.."
		sleep 1
		vim $jp_journal
		;;
	n)
		exit 0
		;;
	*)
		echo "Remember there are two 'journal' files. It's going to open the default (English) one first and then the second (Japanese) one."
		read -p "Press enter to continue.."
		vim $en_journal
		sleep 1
		echo "Opening the second file.."
		sleep 1
		vim $jp_journal
		;;
esac
