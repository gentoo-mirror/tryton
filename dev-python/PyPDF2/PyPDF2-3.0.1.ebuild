# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{6..12} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Python library to work with PDF files"
HOMEPAGE="https://pypi.org/project/PyPDF2/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 x86"

BDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
"
