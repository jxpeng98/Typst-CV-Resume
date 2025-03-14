import sys
import toml
import re
from datetime import datetime

####################
# Modify TOML
####################

# Check if a new version number was provided as a command-line argument
if len(sys.argv) < 2:
    print("Usage: python script.py <new_version>")
    sys.exit(1)

new_version = sys.argv[1]  # Get the new version number from the command-line arguments

# Define the TOML content
toml_content = """
[package]
name = "modernpro-cv"
version = "0.0.1"
entrypoint = "modernpro-cv.typ"
authors = [ "jxpeng98"]
repository = "https://github.com/jxpeng98/Typst-CV-Resume"
license = "MIT"
description = "A CV template inspired by Deedy-Resume."
keywords = ["cv", "resume"]
categories = ["cv"]

[template]
path = "template"
entrypoint = "cv-single.typ"
thumbnail = "thumbnail.png"
"""

# Parse the TOML content
parsed_toml = toml.loads(toml_content)

# Update the version
parsed_toml["package"]["version"] = new_version

# Define a file path to save the updated TOML content
file_path = "typst.toml"

# Write the updated TOML content to a file
with open(file_path, "w") as file:
    toml.dump(parsed_toml, file)

print(f"Updated TOML file saved to {file_path}")


####################
# Update .typ file
####################

new_year = datetime.now().year
new_date = datetime.now().strftime("%Y-%m-%d")
# Define the path to your .typ file
typ_file_path = 'modernpro-cv.typ'

# Define the content to prepend, ensure no leading newline before the first comment line
new_content_to_prepend = f"""///////////////////////////////
// modernpro-cv.typ
// A CV template with modern Sans font and professional look
// Copyright (c) {new_year}
// Author:  Jiaxin Peng
// License: MIT
// Version: {new_version}
// Date:    {new_date}
// Email:   jiaxin.peng@outlook.com
///////////////////////////////

"""  # Ensuring only the intended newlines are included

# Read the existing content of the file
with open(typ_file_path, 'r', encoding='utf-8') as file:
    original_content = file.read()

# Pattern to match the existing header, assuming it's always at the start of the file
header_pattern = re.compile(r'^\/\/+[\s\S]*?\/\/+\n\n', re.MULTILINE)

# Check if the existing header is present and replace it
if header_pattern.search(original_content):
    updated_content = header_pattern.sub(new_content_to_prepend, original_content, count=1)
else:
    # If no header is found, prepend new header without adding an extra newline at the beginning
    updated_content = new_content_to_prepend.rstrip('\n') + original_content

# Write the updated content back to the file
with open(typ_file_path, 'w', encoding='utf-8') as file:
    file.write(updated_content)

print("Template File has been updated with the new version and date.")

# update the main.typ file
def update_main(main_typ_file_path, new_version):
    """Updates import statements in a Typst file to a new version.

    This function updates import statements that match a specific pattern
    (related to "@preview/modernpro-cv") within a given Typst file.  It
    replaces the version number in *all* matching import statements with the
    provided `new_version`.  If no matching import statements are found, it
    prepends a new import statement to the file.

    Args:
        main_typ_file_path: The path to the Typst file to be updated.
        new_version: The new version string to use in the import statements.
    """
    # define the content to prepend (and also use for replacement)
    new_content = f'#import "@preview/modernpro-cv:{new_version}": *\n'

    # Read the existing content of the file
    try:
        with open(main_typ_file_path, 'r', encoding='utf-8') as file:
            original_content = file.read()
    except FileNotFoundError:
        print(f"Error: File not found at {main_typ_file_path}")
        return
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
        return

    # Pattern to match the existing header
    header_pattern = re.compile(
        r'^#import\s+"@preview/modernpro-cv:([^"]+)"\s*:\s*\*\s*\n',
        re.MULTILINE
    )

    # Check if the existing header is present and replace ALL occurrences
    updated_content, num_replacements = header_pattern.subn(new_content, original_content)

    # If no header is found, prepend the new header
    if num_replacements == 0:
        # Prepend new header without adding an extra newline at the beginning
        updated_content = new_content + original_content  # Corrected prepending

    # Write the updated content back to the file
    try:
        with open(main_typ_file_path, 'w', encoding='utf-8') as file:
            file.write(updated_content)
    except Exception as e:
        print(f"An error occurred while writing to the file: {e}")
        return

    if num_replacements > 0:
        print(f"Main Typ File {main_typ_file_path} has been updated. {num_replacements} import statement(s) were updated.")
    else:
        print(f"Main Typ File {main_typ_file_path} has been updated.  A new import statement was prepended.")
    


# define the path to main.typ file
main_typ_file_single_path = 'template/cv-single.typ'
main_typ_file_double_path = 'template/cv-double.typ'

# define the path to README.md
readme_path = 'README.md'

update_main(main_typ_file_single_path, new_version)
update_main(main_typ_file_double_path, new_version)
update_main(readme_path, new_version)





