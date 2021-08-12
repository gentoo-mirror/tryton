# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5..8} )

inherit distutils-r1 desktop xdg-utils

DESCRIPTION="Tryton desktop client"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc calendar spell"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-0.3 )"
RDEPEND="dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-libs/gobject-introspection
	x11-libs/gtk+:3[introspection]
	x11-libs/pango[introspection]
	x11-libs/gdk-pixbuf[introspection]
	dev-python/pycairo[${PYTHON_USEDEP}]
	gnome-base/librsvg
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	calendar? ( >=dev-python/goocalendar-0.7[${PYTHON_USEDEP}] )
	spell? ( app-text/gtkspell:3[introspection] )"

src_compile() {
	distutils-r1_src_compile

	if use doc; then
		pushd doc > /dev/null
		emake html
		popd > /dev/null
	fi
}

src_install() {
	distutils-r1_src_install

	domenu tryton.desktop
	doicon tryton/data/pixmaps/tryton/tryton-icon.png

	dodoc CHANGELOG COPYRIGHT README.rst
	if use doc; then
		docinto html
		dodoc -r doc/_build/html/*
	fi

}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
