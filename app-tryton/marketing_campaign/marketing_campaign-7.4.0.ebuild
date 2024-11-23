# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1 pypi

DESCRIPTION="Tryton module to manage marketing campaign"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/marketing-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	dev-python/python-sql[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=app-tryton/marketing_email-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/marketing_automation-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_opportunity-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/sale_point-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		=app-tryton/web_shortener-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" TEST_NETWORK=0 eunittest
}
