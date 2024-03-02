# Print out all recipes when running `just`
_default:
    @just --list

# Variables
output := "out"
whiskers_cmd := "whiskers"

# Create the output directory
setup:
    mkdir -p {{output}}/color-schemes
    mkdir -p {{output}}/themes

# Remove all files in the output directory
clean:
    rm -fv {{output}}/*.md

# Generate a single "theme" file
gen-theme flavor out:
  @{{whiskers_cmd}} templates/theme.tmpl.ini {{flavor}} -o "{{output}}/themes/Catppuccin {{out}}.ini"

# Generate a single "color-scheme" file
gen-scheme flavor out:
  @{{whiskers_cmd}} templates/color-scheme.tmpl.ini {{flavor}} -o "{{output}}/color-schemes/Catppuccin {{out}}.ini"

# Generate "theme" files
themes: (gen-theme "latte""Latte") (gen-theme "frappe" "Frappe") (gen-theme "macchiato" "Macchiato") (gen-theme "mocha" "Mocha")

# Generate "color-scheme" files
schemes: (gen-scheme "latte""Latte") (gen-scheme "frappe" "Frappe") (gen-scheme "macchiato" "Macchiato") (gen-scheme "mocha" "Mocha")

# Generate all variants
all: setup themes schemes