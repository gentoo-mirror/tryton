# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )

inherit distutils-r1 versionator

DESCRIPTION="Account Stock Anglo-Saxon"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice_stock-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_product-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_stock_continental-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-lang/python[sqlite]
		=app-tryton/purchase-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_supply_drop_shipment-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
		=dev-python/proteus-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
