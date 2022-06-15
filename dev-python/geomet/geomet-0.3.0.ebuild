# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{4..10} )

inherit distutils-r1

DESCRIPTION="Convert GeoJSON to WKT/WKB"
HOMEPAGE="https://github.com/geomet/geomet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/click[$PYTHON_USEDEP]
	dev-python/six[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"

distutils_enable_tests nose

python_test() {
	distutils-r1_python_test --with-doctest
}