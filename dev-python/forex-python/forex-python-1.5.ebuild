# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{3..8}} )
inherit distutils-r1

DESCRIPTION="Foreign exchange rates and currency conversion."
HOMEPAGE="https://github.com/MicroPyramid/forex-python"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/requests
	dev-python/simplejson"
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install
	dodoc README.rst
}
