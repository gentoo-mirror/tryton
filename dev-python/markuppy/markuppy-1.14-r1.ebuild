# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )
PYPI_NO_NORMALIZE=1
PYPI_PN="MarkupPy"

inherit distutils-r1 pypi

DESCRIPTION="An HTML/XML generator"
HOMEPAGE="https://github.com/tylerbakke/MarkupPy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i -e "s/description-file/description_file/" setup.cfg || die
	distutils-r1_src_prepare
}
