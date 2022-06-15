# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Currency Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +data ecb-rate"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	>=dev-python/python-sql-0.9[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	data? (
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		dev-python/pycountry[${PYTHON_USEDEP}]
		dev-python/forex-python[${PYTHON_USEDEP}]
	)
	ecb-rate? (
		dev-python/forex-python[${PYTHON_USEDEP}]
	)"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		dev-python/pycountry[${PYTHON_USEDEP}]
		dev-python/forex-python[${PYTHON_USEDEP}]
	)"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}"/${PN}-remove-rate-update-test.patch
)

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}