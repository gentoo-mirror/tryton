# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..13} pypy )

inherit distutils-r1 pypi

DESCRIPTION="A library to write SQL queries in a pythonic way."
HOMEPAGE="http://python-sql.tryton.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"

distutils_enable_tests unittest

src_install() {
	distutils-r1_src_install
	dodoc README.rst CHANGELOG
}

python_test() {
	eunittest -s sql.tests
}
