# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Party Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +vat phonenumbers"

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/country-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	>=dev-python/python-sql-0.4[${PYTHON_USEDEP}]
	>=dev-python/python-stdnum-1.13[${PYTHON_USEDEP}]
	vat? ( dev-python/python-stdnum[vies] )
	phonenumbers? ( dev-python/phonenumbers[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		=dev-python/proteus-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
		dev-python/phonenumbers[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
