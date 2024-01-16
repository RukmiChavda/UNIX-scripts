#!/bin/bash

# Function to create script based on file extension and set permissions to 755
script() {
	# Check if a filename is provided
    	if [ -z "$1" ]; then
        	echo "Usage: script <filename>"
        	return 1
    	fi

    	# Extract the file extension
    	filename="$1"
    	extension="${filename##*.}"

    	# Create the blank text file
    	touch "$filename"

    	# Check the extension and write the first line accordingly
    	if [ "$extension" = "py" ]; then
        	# For Python script, set the shebang line
        	echo "#!/usr/bin/python3" > "$filename"
        	echo "Python script created: $filename"
    	elif [ "$extension" = "tcl" ]; then
        	# For Tcl script, set the shebang line
        	echo "#!/usr/bin/tclsh" > "$filename"
        	echo "Tcl script created: $filename"
    	elif [ "$extension" = "pl" ]; then
        	# For Perl script, set the shebang line
        	echo "#!/usr/bin/perl" > "$filename"
        	echo "Perl script created: $filename"
    	elif [ "$extension" = "sh" ]; then
        	# For Bash script, set the shebang line
        	echo "#!/usr/bin/bash" > "$filename"
        	echo "Bash script created: $filename"
    	else
        	# If the file extension is not supported, display an error message
        	echo "Unsupported file extension: $extension"
        	return 1
    	fi

    	# Change file permissions to "chmod 755"
    	chmod 755 "$filename"
    	echo "File permissions changed to 755: $filename"
}

# Example usage:
script e1.py    # Create Python script
script e2.tcl   # Create Tcl script
script e3.pl    # Create Perl script
script e4.sh    # Create Bash script