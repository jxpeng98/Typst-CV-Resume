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
name = "modernpro-coverletter"
version = "0.0.1"
entrypoint = "modernpro-coverletter.typ"
authors = [ "jxpeng98"]
repository = "https://github.com/jxpeng98/typst-coverletter"
license = "MIT"
description = "A cover letter template with modern Sans font for job applications and other formal letters."
categories = ["coverletter", "CV", "Job"]

[template]
path = "template"
entrypoint = "main.typ"
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
typ_file_path = 'modernpro-coverletter.typ'

# Define the content to prepend, ensure no leading newline before the first comment line
new_content_to_prepend = f"""///////////////////////////////
// modernpro-coverletter.typ
// A cover letter template with modern Sans font for job applications and other formal letters.
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

# define the path to main.typ file
main_typ_file_path = 'template/main.typ'

# define the content to prepend
new_content_to_prepend = f"""#import "@preview/modernpro-coverletter:{new_version}": *

"""  # Ensuring only the intended newlines are included

# Read the existing content of the file
with open(main_typ_file_path, 'r', encoding='utf-8') as file:
    original_content = file.read()
    
# Pattern to match the existing header, assuming it's always at the start of the file
header_pattern = re.compile(
    r'^#import\s+"@preview/modernpro-coverletter:([^"]+)"\s*:\s*\*\s*\n',
    re.MULTILINE
)

# Check if the existing header is present and replace it
if header_pattern.search(original_content):
    updated_content = header_pattern.sub(new_content_to_prepend, original_content, count=1)
else:
    # If no header is found, prepend new header without adding an extra newline at the beginning
    updated_content = new_content_to_prepend.rstrip('\n') + original_content
    
# Write the updated content back to the file
with open(main_typ_file_path, 'w', encoding='utf-8') as file:
    file.write(updated_content)
    
print("Main.typ file has been updated with the new version.")



