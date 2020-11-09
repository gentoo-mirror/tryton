# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..8} )
inherit distutils-r1

DESCRIPTION="Tools for working with the OFX (Open Financial Exchange) file format"
HOMEPAGE="https://sites.google.com/site/ofxparse/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[$PYTHON_USEDEP]"
RDEPEND="dev-python/beautifulsoup[$PYTHON_USEDEP]
	dev-python/lxml[$PYTHON_USEDEP]
	dev-python/six[$PYTHON_USEDEP]"

src_install() {
	distutils-r1_src_install
	dodoc README.rst AUTHORS
}

python_test() {
	esetup.py test || die
}
