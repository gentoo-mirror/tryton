# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A library to access Tryton's models like a client"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="trytond test"

RDEPEND="trytond? ( =app-office/trytond-$(ver_cut 1-2)*[$PYTHON_USEDEP] )
	dev-python/python-dateutil[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]
	test? (
		=app-office/trytond-$(ver_cut 1-2)*[sqlite,$PYTHON_USEDEP]
		=app-tryton/party-$(ver_cut 1-2)*[$PYTHON_USEDEP]
		)"

DOCS="CHANGELOG COPYRIGHT README.rst"

src_prepare() {
	sed -i -e "s/README/SKIP/" proteus/tests/__init__.py || die
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test || die
}
