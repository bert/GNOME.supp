gio_supp_FILES := $(wildcard gio/*.supp)
glib_supp_FILES := $(wildcard glib/*.supp)
gtk_supp_FILES := $(wildcard gtk+/*.supp)
gtk3_supp_FILES := $(gtk_supp_FILES) $(wildcard gtk+/3.x/*.supp)
gtksourceview_supp_FILES := $(wildcard gtksourceview/*.supp)

GENERATED_SUPP_FILES = gio.supp glib.supp gtk.supp gtk3.supp gtksourceview.supp

.PHONY: all clean

all: $(GENERATED_SUPP_FILES)

clean:
	$(RM) $(GENERATED_SUPP_FILES)

gio.supp: $(gio_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
glib.supp: $(glib_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtk.supp: $(gtk_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtk3.supp: $(gtk3_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtksourceview.supp: $(gtksourceview_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
