# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Account Stock Anglo-Saxon"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice_stock-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_stock_continental-$(ver_cut 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-lang/python[sqlite]
		=app-tryton/purchase-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_supply_drop_shipment-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
