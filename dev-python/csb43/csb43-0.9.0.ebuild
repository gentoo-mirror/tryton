# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )
inherit distutils-r1

DESCRIPTION="Tools to convert files in format used by multiple Spanish banks"
HOMEPAGE="https://bitbucket.org/wmj/csb43"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="babel yaml formats test"

RDEPEND="
	>=dev-python/pycountry-16.10.23[$PYTHON_USEDEP]
	babel? ( dev-python/Babel[$PYTHON_USEDEP] )
	yaml? ( dev-python/pyyaml[$PYTHON_USEDEP] )
	formats? ( >=dev-python/tablib-0.11.3[$PYTHON_USEDEP] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"
BDEPEND=""

src_prepare() {
	sed -i -e "s/upload-dir/upload_dir/" setup.cfg || die
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test || die
}
