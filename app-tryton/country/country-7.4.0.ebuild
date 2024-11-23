# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Country Module"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +data geonames bash-completion"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	dev-python/python-sql[${PYTHON_USEDEP}]
	data? (
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		>=dev-python/pycountry-16.11.8[${PYTHON_USEDEP}]
	)
	geonames? ( =dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}] )
	bash-completion? ( dev-python/argcomplete[$PYTHON_USEDEP] )"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		>=dev-python/pycountry-16.11.8[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

src_prepare() {
	# requires network
	rm tests/scenario_country_import.rst || die
	distutils-r1_src_prepare
}

python_test() {
	DB_NAME=":memory:" TEST_NETWORK=0 eunittest
}
