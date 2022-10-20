# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Module to integrate Tryton with Shopify"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_payment-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/currency-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product_attribute-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/sale-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/sale_payment-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/web_shop-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	<dev-python/ShopifyAPI-12.0.0[${PYTHON_USEDEP}]
	dev-python/pyactiveresource[${PYTHON_USEDEP}]
	dev-python/python-sql[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/account_payment_clearing-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/customs-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/product_measurements-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/product_image-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_discount-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_shipment_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_secondary_unit-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	)"
RESTRICT="!test? ( test )"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
