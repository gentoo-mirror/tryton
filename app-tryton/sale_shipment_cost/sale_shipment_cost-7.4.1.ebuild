# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Sale Shipment Cost Module"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/python-sql[${PYTHON_USEDEP}]
	=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/carrier-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/currency-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/sale-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock_shipment_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/account-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/stock-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_promotion-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_shipment_grouping-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" TEST_NETWORK=0 eunittest
}
