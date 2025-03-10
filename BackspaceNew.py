#!/usr/bin/env python
# Created by linuxitos
# Updated to prevent backspace from going back when renaming a file/folder in Nautilus

import gi

gi.require_version('Nautilus', '4.0')
gi.require_version('Gtk', '4.0')
from gi.repository import GObject, Nautilus, Gtk, GLib

def idle_callback(*args):
    app = Gtk.Application.get_default()
    
    # Check if the focus is not on a text entry (for renaming) to allow backspace to go back
    if isinstance(app.get_active_window(), Gtk.Entry):
        return False  # Don't do anything if we are in a text entry (renaming file/folder)
    
    # Otherwise, bind Backspace to the "Go Back" action
    app.set_accels_for_action("slot.up", ["BackSpace"])
    return False

def window_added(*args):
    GLib.idle_add(idle_callback, None)

class BackspaceBack(GObject.GObject, Nautilus.ColumnProvider):
    app = Gtk.Application.get_default()
    app.set_accels_for_action("slot.up", ["BackSpace"])
    app.connect("window-added", window_added)
