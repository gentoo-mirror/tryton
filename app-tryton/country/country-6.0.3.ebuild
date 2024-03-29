# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1

DESCRIPTION="Country Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +data geonames"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	data? (
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		<=dev-python/pycountry-20.7.3[${PYTHON_USEDEP}]
	)
	geonames? ( =dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		<=dev-python/pycountry-20.7.3[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

src_prepare() {
	# requires network
	rm tests/scenario_country_import.rst || die
	distutils-r1_src_prepare
}

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
