# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
PYPI_PN=backports.entry_points_selectable
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Compatibility shim providing selectable entry points for older implementations"
HOMEPAGE="
	https://pypi.org/project/backports.entry-points-selectable/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
