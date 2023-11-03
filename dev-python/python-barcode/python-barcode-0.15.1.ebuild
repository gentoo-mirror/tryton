# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Create standard barcodes with Python"
HOMEPAGE="
	https://pypi.org/project/python-barcode/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="image"

RDEPEND="image? ( dev-python/pillow[$PYTHON_USEDEP] )"
DOCS=( README.rst )

distutils_enable_tests pytest

src_prepare() {
	rm setup.cfg
	distutils-r1_src_prepare
}
