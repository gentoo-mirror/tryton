# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Landed Cost per Weight Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_stock_landed_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product_measurements-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock_shipment_measurements-$(ver_cut 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
