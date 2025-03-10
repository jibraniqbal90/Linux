#!/usr/bin/env python

# created by linuxitos
# Updated to properly handle backspace during folder creation and renaming

import gi

gi.require_version('Nautilus', '4.0')
gi.require_version('Gtk', '4.0')
from gi.repository import GObject, Nautilus, Gtk, GLib


def key_press_event(window, event):
    """Handle key press events specifically to catch Backspace."""
    if isinstance(window, Gtk.Entry):
        # If we're in a Gtk.Entry (e.g., renaming or folder creation), do nothing, let Backspace delete
        return False
    if event.keyval == Gtk.keysyms.BackSpace:
        # If Backspace is pressed and we're not in an Entry, trigger "Go Back" action
        window.emit("go-back")
        return True
    return False


def window_added(window, *args):
    """Connect to window added event to bind the key event."""
    window.connect("key-press-event", key_press_event)


class BackspaceBack(GObject.GObject, Nautilus.ColumnProvider):
    def __init__(self):
        super().__init__()
        self.app = Gtk.Application.get_default()
        self.app.connect("window-added", window_added)


# Instantiate and activate the script
BackspaceBack()
