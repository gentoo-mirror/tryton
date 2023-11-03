# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Fetch currency rates from the Serbian National Bank"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/currency-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/zeep[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	)"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}"/${PN}-remove-rate-update-test.patch
)

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

src_prepare() {
	# requires network
	rm tests/scenario_currency_rs.rst
	distutils-r1_src_prepare
}

python_test() {
	DB_NAME=":memory:" eunittest
}
