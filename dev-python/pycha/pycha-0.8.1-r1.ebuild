# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )

inherit distutils-r1 pypi

DESCRIPTION="A library for making charts with Python"
HOMEPAGE="http://bitbucket.org/lgs/pycha/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/cairocffi[$PYTHON_USEDEP]"
RDEPEND="${DEPEND}"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}"/${P}-chavier-python3.patch
)

DOCS="CHANGES.txt README.txt"

python_test() {
	esetup.py test || die
}
