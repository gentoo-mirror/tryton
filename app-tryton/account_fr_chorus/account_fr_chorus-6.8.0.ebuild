# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYPI_PN="trytond_${PN}"

inherit distutils-r1

DESCRIPTION="Tryton module to communicate with Chorus"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_invoice-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/company-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party_siret-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		=app-tryton/edocument_uncefact-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		)"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

distutils_enable_tests unittest

python_test() {
	DB_NAME=":memory:" eunittest
}
