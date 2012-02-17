glib_supp_FILES := $(wildcard glib/*.supp)
gio_supp_FILES := $(wildcard gio/*.supp)
pango_supp_FILES := $(wildcard pango/*.supp)
gail_supp_FILES := $(wildcard gail/*.supp)
gdk_supp_FILES := $(wildcard gdk/*.supp)
gtk_supp_FILES := $(wildcard gtk+/*.supp)
gtk3_supp_FILES := $(wildcard gtk+/3.x/*.supp)
gtksourceview_supp_FILES := $(wildcard gtksourceview/*.supp)

BASE_GENERATED_SUPP_FILES = glib.supp gio.supp pango.supp gail.supp gdk.supp gtk.supp gtk3.supp gtksourceview.supp
base_supp_FILES = glibc.supp fontconfig.supp $(BASE_GENERATED_SUPP_FILES)

ALL_GENERATED_SUPP_FILES = $(BASE_GENERATED_SUPP_FILES) base.supp

.PHONY: all clean

all: $(ALL_GENERATED_SUPP_FILES)

clean:
	$(RM) $(ALL_GENERATED_SUPP_FILES)

glib.supp: $(glib_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gio.supp: $(gio_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
pango.supp: $(pango_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gail.supp: $(gail_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gdk.supp: $(gdk_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtk.supp: $(gtk_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtk3.supp: $(gtk3_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
gtksourceview.supp: $(gtksourceview_supp_FILES)
	cat -- $^ | sed '/^#/d' | cat COPYING - >$@
base.supp: Makefile $(base_supp_FILES)
	cat -- $(filter %.supp,$^) | sed '/^#/d' | cat COPYING - >$@
