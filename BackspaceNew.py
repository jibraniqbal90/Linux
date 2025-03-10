#!/usr/bin/env python

# created by linuxitos
# Updated to specifically handle backspace for folder renaming and creation

import gi

gi.require_version('Nautilus', '4.0')
gi.require_version('Gtk', '4.0')
from gi.repository import GObject, Nautilus, Gtk, GLib


def on_key_press_event(window, event):
    """Handle key press events, specifically Backspace."""
    if isinstance(window, Gtk.Entry):
        # If we're in a Gtk.Entry (e.g., renaming or folder creation), let Backspace delete
        if event.keyval == Gtk.keysyms.BackSpace:
            return False  # Default behavior: delete character
    return True  # For other cases, do nothing and allow default behavior


def window_added(window, *args):
    """Connect key press event to window added event."""
    window.connect("key-press-event", on_key_press_event)


class BackspaceBack(GObject.GObject, Nautilus.ColumnProvider):
    def __init__(self):
        super().__init__()
        self.app = Gtk.Application.get_default()
        # Connect to window-added signal, to bind the key press event handler
        self.app.connect("window-added", window_added)


# Instantiate the BackspaceBack handler
BackspaceBack()
