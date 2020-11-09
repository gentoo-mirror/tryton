# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..7} )
inherit distutils-r1

DESCRIPTION="Adds Geographic Information System support to trytond"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=app-office/trytond-$(ver_cut 1-2)*[${PYTHON_USEDEP}]
	>=dev-python/psycopg-2.0.14[${PYTHON_USEDEP}]
	dev-python/geomet[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS="CHANGELOG COPYRIGHT doc/*.rst"
