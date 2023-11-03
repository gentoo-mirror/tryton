# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Integrate with Vue Storefront"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/sale-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/web_shop-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/web_user-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	dev-python/elasticsearch[${PYTHON_USEDEP}]
	>=dev-python/python-stdnum-1.1.0[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/product_attribute-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/product_image-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_promotion_coupon-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_shipment_cost-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/carrier-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" eunittest
}
