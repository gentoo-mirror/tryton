# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Web User Module"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="bcrypt html2text test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	bcrypt? ( dev-python/bcrypt[$PYTHON_USEDEP] )
	html2text? ( dev-python/html2text[$PYTHON_USEDEP] )"
DEPEND="${RDEPEND}
	test? ( $(python_gen_impl_dep sqlite) )"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" eunittest
}
