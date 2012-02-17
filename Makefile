glib_supp_FILES := $(wildcard glib/*.supp)
gio_supp_FILES := $(wildcard gio/*.supp)
pango_supp_FILES := $(wildcard pango/*.supp)
gail_supp_FILES := $(wildcard gail/*.supp)
gdk_supp_FILES := $(wildcard gdk/*.supp)
gtk_supp_FILES := $(wildcard gtk+/*.supp)
gtk3_supp_FILES := $(wildcard gtk+/3.x/*.supp)
gtksourceview_supp_FILES := $(wildcard gtksourceview/*.supp)

GENERATED_SUPP_FILES_EXCEPT_ALL_SUPP = glib.supp gio.supp pango.supp gail.supp gdk.supp gtk.supp gtk3.supp gtksourceview.supp

all_supp_FILES = glibc.supp fontconfig.supp $(GENERATED_SUPP_FILES_EXCEPT_ALL_SUPP)

.PHONY: all clean

all: $(GENERATED_SUPP_FILES_EXCEPT_ALL_SUPP) all.supp

clean:
	$(RM) $(GENERATED_SUPP_FILES_EXCEPT_ALL_SUPP) all.supp

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
all.supp: Makefile $(all_supp_FILES)
	cat -- $(filter %.supp,$^) | sed '/^#/d' | cat COPYING - >$@
