# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )

inherit distutils-r1 versionator

DESCRIPTION="A library to access Tryton's models like a client"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="trytond test"

RDEPEND="trytond? ( =app-office/trytond-$(get_version_component_range 1-2)*[$PYTHON_USEDEP] )
	dev-python/python-dateutil[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]
	test? ( =app-office/trytond-$(get_version_component_range 1-2)*[sqlite,$PYTHON_USEDEP] )"

DOCS="CHANGELOG COPYRIGHT README"

python_test() {
	esetup.py test || die
}
