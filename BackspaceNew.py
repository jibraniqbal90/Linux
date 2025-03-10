#!/usr/bin/env python
# created by linuxitos

# Changed from win.up to slot.up to work with gnome47 and fedora41
import gi

gi.require_version('Nautilus', '4.0')
gi.require_version('Gtk', '4.0')
from gi.repository import GObject, Nautilus, Gtk, GLib


def idle_callback(*args):
    app = Gtk.Application.get_default()
    app.set_accels_for_action("slot.up", ["BackSpace"])
    return False


def window_added(*args):
    GLib.idle_add(idle_callback, None)


class BackspaceBack(GObject.GObject, Nautilus.ColumnProvider):
    def __init__(self):
        self.app = Gtk.Application.get_default()
        self.app.set_accels_for_action("slot.up", ["BackSpace"])
        self.app.connect("window-added", window_added)


# Register the extension
def create_backspace_back():
    return BackspaceBack()


# Connect the extension to Nautilus
if __name__ == "__main__":
    extension = create_backspace_back()
    Gtk.main()
