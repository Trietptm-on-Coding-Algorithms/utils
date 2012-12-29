#!/bin/bash

# Check for class names or function definitions
if (( $# >= 1 )) ; then
	# Specify class name to use or insert
	if [[ $1 == "-c" || $1 == "-i" ]] ; then
		class_name=$2
		temp_file="/tmp/$class_name.java"
		class_file="$(basename ${temp_file/.java//})"

		# Class definition insertion
		if [[ $1 == "-i" ]] ; then
			insert_class_name=1
		fi

		if [[ $3 == "-m" ]] ; then
			# Specify main function insertion
			func_def="public static void main(String args[])"
		elif [[ $3 == "-f" ]] ; then
			# Specify custom function definition to insert
			func_def=$4
		fi
	fi
else
	# Class name must be specified for now
	echo "No class specified"
	exit 1
fi

# Clear out temporary file
rm $temp_file 2> /dev/null
touch "$temp_file"

# Add class and function specifiers
if [[ ! -z $insert_class_name ]] ; then
	echo "class $class_name"" {" >> "$temp_file"
fi
if [[ ! -z $func_def ]] ; then
	echo "$func_def"" {" >> "$temp_file"
fi

# Read each line from stdin and put it in the temp code
while read line
do
	if [[ $line == "q" ]] ; then
		break
	else
		echo $line >> "$temp_file"
	fi
done

# Close the class and function specifiers
if [[ ! -z $insert_class_name ]] ; then
	echo "}" >> "$temp_file"
fi
if [[ ! -z $func_def ]] ; then
	echo "}" >> "$temp_file"
fi

# Compile, run, and cleanup
javac -d . "$temp_file" && java "$class_file"
rm "$class_file.class"
