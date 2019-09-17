# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="The GTK Client for three-tiers high-level general purpose application framework"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +simplejson calendar"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-0.3 )"
RDEPEND=">=dev-python/pygtk-2.6[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	gnome-base/librsvg
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	simplejson? ( dev-python/simplejson[${PYTHON_USEDEP}] )
	calendar? ( dev-python/goocalendar[${PYTHON_USEDEP}] )"

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

	dodoc CHANGELOG COPYRIGHT README
	if use doc; then
		docinto html
		dodoc -r doc/_build/html/*
	fi

}
