# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..10} )
inherit distutils-r1

MY_PN="MarkupPy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="An HTML/XML generator"
HOMEPAGE="https://github.com/tylerbakke/MarkupPy"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i -e "s/description-file/description_file/" setup.cfg || die
	distutils-r1_src_prepare
}
