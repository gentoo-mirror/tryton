# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1 versionator

DESCRIPTION="Package Shipping Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/carrier-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock_package-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/stock_shipment_measurements-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/sale_shipment_cost-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/product_measurements-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-lang/python[sqlite]
		=dev-python/proteus-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
