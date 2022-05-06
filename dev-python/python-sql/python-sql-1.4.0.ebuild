# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{5..10} pypy )

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

distutils_enable_tests unittest

src_install() {
	distutils-r1_src_install
	dodoc README CHANGELOG
}

python_test() {
	eunittest -s sql.tests
}
