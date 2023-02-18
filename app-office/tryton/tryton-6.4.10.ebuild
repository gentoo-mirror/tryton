# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1 desktop xdg-utils

DESCRIPTION="Tryton desktop client"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc calendar document spell test"

DEPEND="doc? ( >=dev-python/sphinx-0.3 )"
RDEPEND="dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-libs/gobject-introspection
	x11-libs/gtk+:3[introspection]
	x11-libs/pango[introspection]
	x11-libs/gdk-pixbuf[introspection]
	dev-python/pycairo[${PYTHON_USEDEP}]
	gnome-base/librsvg
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	calendar? ( >=dev-python/goocalendar-0.7[${PYTHON_USEDEP}] )
	document? ( app-text/evince[introspection] )
	spell? ( app-text/gtkspell:3[introspection] )"
RESTRICT="!test? ( test )"
DOCS=( CHANGELOG COPYRIGHT README.rst )

distutils_enable_tests unittest

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

	if use doc; then
		docinto html
		dodoc -r doc/_build/html/*
	fi

}

python_test() {
	eunittest -s tryton.tests
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}