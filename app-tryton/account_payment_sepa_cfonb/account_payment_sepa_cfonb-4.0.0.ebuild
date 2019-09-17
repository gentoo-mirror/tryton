# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1 versionator

DESCRIPTION="Tryton module for CFONB SEPA payment"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_payment-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/account_payment_sepa-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/company-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/bank-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/party-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	dev-python/genshi[${PYTHON_USEDEP}]
	>=dev-python/lxml-2.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-lang/python[sqlite]
		dev-python/mock[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
