# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN=python-Levenshtein
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Functions for fast computation of Levenshtein distance, and edit operations"
HOMEPAGE="https://pypi.org/project/python-Levenshtein/
	https://github.com/ztane/python-Levenshtein/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
DEPENDS="dev-python/Levenshtein[$PYTHON_USEDEP]"
