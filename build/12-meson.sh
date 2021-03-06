#!/bin/bash
# 12-meson.sh: Builds Meson sources
##@copyright GPL-2.0+
abtryexe meson

build_meson_probe(){
	[ -e meson.build ]
}

build_meson_build() {
	mkdir "$SRCDIR"/build
	meson ${MESON_DEF} ${MESON_AFTER} "$SRCDIR" "$SRCDIR"/build
        cd "$SRCDIR"/build
	ninja
	DESTDIR="$PKGDIR" ninja install
	cd "$SRCDIR"
}

ABBUILDS+=' meson'
