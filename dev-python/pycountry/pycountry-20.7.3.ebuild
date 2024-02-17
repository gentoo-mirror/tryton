# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{7..12} )

inherit distutils-r1 pypi

DESCRIPTION="Database of countries, subdivisions, languages, currencies and script"
HOMEPAGE="https://github.com/flyingcircusio/pycountry"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ia64 ~ppc ~riscv ~sparc ~x86"

distutils_enable_tests pytest

# https://github.com/flyingcircusio/pycountry/pull/51
PATCHES=( "${FILESDIR}/${P}-fix-tests-for-pypy3.patch" )
