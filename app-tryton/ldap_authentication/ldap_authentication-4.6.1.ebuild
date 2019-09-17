# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )

inherit distutils-r1 versionator

DESCRIPTION="LDAP Authentication Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="=app-office/trytond-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	dev-python/ldap3[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools
	test? (
		dev-lang/python[sqlite]
		dev-python/mock[${PYTHON_USEDEP}]
		)"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README doc/*.rst"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
