# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="A library for making charts with Python"
HOMEPAGE="http://bitbucket.org/lgs/pycha/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/pycairo[$PYTHON_USEDEP]"
RDEPEND="${DEPEND}"

DOCS="CHANGES.txt README.txt"

python_test() {
	esetup.py test || die
}
