# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..12} )

inherit distutils-r1 pypi

DESCRIPTION="Convert GeoJSON to WKT/WKB"
HOMEPAGE="https://github.com/geomet/geomet"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/click[$PYTHON_USEDEP]
	dev-python/six[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"
