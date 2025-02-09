#!/bin/bash



# string="Hello World This is a test"

# space_count=$(echo "$string" | tr -cd ' ' | wc -c)

# echo "Number of spaces: $space_count"


# Path to the GTK CSS file
GTK_CSS_SOURCE="$HOME/.config/gtk-4.0/gtk.css"

# Check if the source GTK CSS file exists
if [ ! -f "$GTK_CSS_SOURCE" ]; then
    echo "Error: GTK CSS file not found at $GTK_CSS_SOURCE"
    exit 1
fi

# Loop through all installed Flatpak applications
for app in $( flatpak list --app --columns=application | tail -n +1); do
    GTK_CSS_DEST="$HOME/.var/app/$app/config/gtk-4.0"
    
    # Create the destination directory if it doesn't exist
    mkdir -p "$GTK_CSS_DEST"

    # Copy the GTK CSS file
    cp "$GTK_CSS_SOURCE" "$GTK_CSS_DEST/gtk.css"

    echo "Applied GTK CSS to $app"
done

echo "GTK CSS applied to all Flatpak apps."
