# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1

DESCRIPTION="Party Module"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +vat phonenumbers"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/country-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	>=dev-python/python-sql-0.4[${PYTHON_USEDEP}]
	>=dev-python/python-stdnum-1.15[${PYTHON_USEDEP}]
	vat? ( dev-python/python-stdnum[vies] )
	phonenumbers? ( dev-python/phonenumbers[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		dev-python/phonenumbers[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" eunittest
}
