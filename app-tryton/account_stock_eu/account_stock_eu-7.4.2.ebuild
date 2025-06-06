# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Tryton module for European stock accounting"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/company-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/country-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/currency-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/customs-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product_measurements-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock_shipment_measurements-$(ver_cut 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/carrier-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/incoterm-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/production-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/purchase_shipment_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/stock_consignment-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/stock_package_shipping-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/stock_shipment_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" TEST_NETWORK=0 eunittest
}
