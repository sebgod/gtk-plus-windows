BITNESS     := win32
# source: http://www.gtk.org/download/$(BITNESS).php
GTK_VERSION := 
URL_BASE    := http://win32builder.gnome.org/packages/$(GTK_VERSION)
DEPS_BASE   := http://ftp.gnome.org/pub/gnome/binaries/$(BITNESS)/dependencies
DOWNLOAD    := wget -N
DEL_DIR     := rm -fR
DEL_FILE    := rm -f
MKDIR       := mkdir -p
UNPACK      := 7za x -scsUTF-8 -bd -y

# GTK+ individual packages
ZIPS := glib_2.34.3-1_$(BITNESS).zip
ZIPS += glib-dev_2.34.3-1_$(BITNESS).zip
ZIPS += atk_2.6.0-1_$(BITNESS).zip
ZIPS += atk-dev_2.6.0-1_$(BITNESS).zip
ZIPS += pango_1.30.1-1_$(BITNESS).zip
ZIPS += pango-dev_1.30.1-1_$(BITNESS).zip
ZIPS += gdk-pixbuf_2.26.5-1_$(BITNESS).zip
ZIPS += gdk-pixbuf-dev_2.26.5-1_$(BITNESS).zip
ZIPS += gtk+_3.6.4-1_$(BITNESS).zip
ZIPS += gtk+-dev_3.6.4-1_$(BITNESS).zip

# required third party dependencies
ZIPS += cairo_1.10.2-2_$(BITNESS).zip
ZIPS += cairo-dev_1.10.2-2_$(BITNESS).zip
ZIPS += libpng_1.5.14-1_$(BITNESS).zip
ZIPS += libpng-dev_1.5.14-1_$(BITNESS).zip
ZIPS += libxml2_2.8.0-1_$(BITNESS).zip
ZIPS += libxml2-dev_2.8.0-1_$(BITNESS).zip
ZIPS += freetype_2.4.11-1_$(BITNESS).zip
ZIPS += freetype-dev_2.4.11-1_$(BITNESS).zip
ZIPS += fontconfig_2.10.2-1_$(BITNESS).zip
ZIPS += fontconfig-dev_2.10.2-1_$(BITNESS).zip
# these are provided by msys/MinGW
# ZIPS += zlib_1.2.7-1_$(BITNESS).zip
# ZIPS += zlib-dev_1.2.7-1_$(BITNESS).zip
# ZIPS += libiconv_1.13.1-1_$(BITNESS).zip
# ZIPS += libiconv-dev_1.13.1-1_$(BITNESS).zip
# ZIPS += gettext_0.18.2.1-1_$(BITNESS).zip
# ZIPS += gettext-dev_0.18.2.1-1_$(BITNESS).zip

# other third party
ZIPS += rsvg_2.36.4-1_$(BITNESS).zip
ZIPS += rsvg-dev_2.36.4-1_$(BITNESS).zip
ZIPS += croco_0.6.8-1_$(BITNESS).zip
ZIPS += croco-dev_0.6.8-1_$(BITNESS).zip
ZIPS += pixman_0.26.0-1_$(BITNESS).zip
ZIPS += pixman-dev_0.26.0-1_$(BITNESS).zip
ZIPS += pkg-config_0.28-1_$(BITNESS).zip
ZIPS += pkg-config-dev_0.28-1_$(BITNESS).zip

.PHONY: update
update: $(BITNESS)/update

.PHONY: all
all: $(BITNESS)/all

$(BITNESS)/update: $(ZIPS)
	$(MKDIR) $@
	$(foreach ZIP,$?, $(UNPACK) -o$@ $(ZIP);)

cairo%.zip:
	$(DOWNLOAD) $(DEPS_BASE)/cairo$*.zip

%.zip:
	$(DOWNLOAD) $(URL_BASE)/$*.zip

$(BITNESS)/all: $(ZIPS)
	$(MKDIR) $@
	$(foreach ZIP,$^, $(UNPACK) -o$@ $(ZIP);)

.PHONY: clean
clean:
	$(DEL_DIR) win*

.PHONY: realclean
realclean: clean
	$(DEL_FILE) *.zip
