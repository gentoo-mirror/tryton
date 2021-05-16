# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{3..9} pypy )

inherit distutils-r1

DESCRIPTION="A library to write SQL queries in a pythonic way."
HOMEPAGE="http://python-sql.tryton.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"

src_install() {
	distutils-r1_src_install
	dodoc README CHANGELOG
}

python_test() {
	esetup.py test || die
}
