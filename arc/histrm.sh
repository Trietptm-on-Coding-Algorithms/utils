#!/bin/bash
# This script cleans out a list of files or folders from the git revision history.
# The user can make the changes permanant, non-permanant, or automatically revert the changes.
# Options:
# f - Forces removing items from the history without a confirmation prompt
# c - Forces cleaning up the objects afterwards -- making the changes permanant

FORCE=false
FORCECLEAN=false
FORCEPUSH=false

usage()
{
	# Display the command usage to the user
	echo "Usage: `basename $0` options (-fc)"
}

filterHistory()
{
	echo "Filtering history..."
	# Filter out history
	git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch $@' --prune-empty --tag-name-filter cat -- --all
	echo "History filtered."
}

revertHistory()
{
	echo "Reverting history..."
	# Does not work after cleaning up objects
	git reset --hard .git/refs/original/master
	echo "History reverted."
}

cleanObjects()
{
	echo "Cleaning out objects..."
	# Delete refs backup
	rm -rf .git/refs/original/
	# Expire objects
	git reflog expire --expire=now --all
	# Delete expired objects
	git gc --prune=now
	echo "Objects cleaned out. Old history is no longer recoverable. You will need to force changes upstream."
}

# Check to make sure there are arguments to the script
if [ "$#" != 0 ]
then
	while getopts ":fcp" OPTION
	do
		case $OPTION in
			f ) FORCE=true;;
			c ) FORCECLEAN=true;;
			p ) FORCEPUSH=true;; # Not used at the moment
	  		* ) usage; exit 85;; # Default.
		esac
	done

	shift $(($OPTIND - 1))
fi

if [ !$FORCE ]
then
	# Sanity check
	echo "The following files and directories will be deleted from your revision history:"
	# Run a dry run of the command
	git rm -rfn --cached --ignore-unmatch $@

	# Prompt for confirmation
	echo
	echo "Are you sure you want to continue?"
	select i_cleanHistory in Yes No
	do
		case $i_cleanHistory in
			Yes ) filterHistory; break;;
			No  ) exit;;
		esac
	done
else
	# Force filtering history
	filterHistory
fi

if [ !$FORCECLEAN ]
then
	# Check to see if user is satisfied
	echo "Would you like to make these changes permanant?"
	select i_cleanObjects in Yes No Revert
	do
		case $i_cleanObjects in
			Yes ) cleanObjects; break;;
			No ) echo "Old history is still recoverable."; break;;
			Revert ) revertHistory; break;;
		esac
	done
else
	# Force cleaning objects
	cleanObjects
fi

# Script does not push upstream automatically at the moment
: '
if [ !$FORCEPUSH ]
then
	# Check to see if user wants to force changes upstream
	echo "Would you like to force the changes upstream now?"
	select i_pushUpstream in Yes No
	do
		case $i_pushUpstream in
			Yes ) pushUpstream; break;;
			No ) break;;
		esac
	done
else
	# Force cleaning objects
	pushUpstream
fi
'

exit
