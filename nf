#!/bin/bash
# normalizes file names
if (( $# == 0 )) ; then
	echo "No files specified."
	exit 1
fi

files=("$@")
#echo ${files[@]}
perl-rename -v 'y/A-Z/a-z/' -- *
perl-rename -v 's/ /-/g' -- *
perl-rename -v 's/&/-/g' -- *
perl-rename -v 's/\)//g' -- *
perl-rename -v 's/\(//g' -- *
perl-rename -v 's/://g' -- *
perl-rename -v 's/_/-/g' -- *
perl-rename -v "s/'//g" -- *
perl-rename -v 's/"//g' -- *
perl-rename -v 's/,//g' -- *
perl-rename -v 's/\.-/-/g' -- *
for (( i=0; i<3; i++ )) ; do
	perl-rename -v 's/--/-/g' -- *
done
#ls -F
