# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 pypi

DESCRIPTION="A library to access Tryton's models like a client"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="trytond test"

RDEPEND="trytond? ( =app-office/trytond-$(ver_cut 1-2)*[$PYTHON_USEDEP] )
	dev-python/defusedxml[$PYTHON_USEDEP]
	dev-python/python-dateutil[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	test? (
		=app-office/trytond-$(ver_cut 1-2)*[sqlite,$PYTHON_USEDEP]
		=app-tryton/party-$(ver_cut 1-2)*[$PYTHON_USEDEP]
		)"
RESTRICT="!test? ( test )"

DOCS=( CHANGELOG COPYRIGHT README.rst )

distutils_enable_tests unittest

src_prepare() {
	sed -i -e "s/README/SKIP/" proteus/tests/__init__.py || die
	distutils-r1_src_prepare
}

python_test() {
	DB_NAME=":memory:" eunittest -s proteus.tests
}
