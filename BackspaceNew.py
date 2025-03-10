#!/usr/bin/env python

# created by linuxitos
# Changed from win.up to slot.up to work with gnome47 and fedora41

import gi

gi.require_version('Nautilus', '4.0')
gi.require_version('Gtk', '4.0')
from gi.repository import GObject, Nautilus, Gtk, GLib


def idle_callback(*args):
    # Get the default application
    app = Gtk.Application.get_default()
    
    # Set the accelerator for Backspace only if we are not renaming a file/folder
    if not isinstance(app.get_active_window(), Gtk.Entry):
        app.set_accels_for_action("slot.up", ["BackSpace"])
    return False


def window_added(*args):
    # This ensures that the callback is called when a new window is added
    GLib.idle_add(idle_callback, None)


class BackspaceBack(GObject.GObject, Nautilus.ColumnProvider):
    def __init__(self):
        super().__init__()
        # Get the default application
        self.app = Gtk.Application.get_default()
        # Initially, bind Backspace for "Go Back" action
        self.app.set_accels_for_action("slot.up", ["BackSpace"])
        # Connect to window-added signal
        self.app.connect("window-added", window_added)


# Instantiate and activate the script
BackspaceBack()
