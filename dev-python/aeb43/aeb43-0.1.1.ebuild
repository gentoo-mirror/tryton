# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="A module to parse AEB43 files"
HOMEPAGE="https://pypi.org/project/aeb43/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/python-stdnum[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}"
DOCS=( CHANGELOG README.rst )

distutils_enable_tests unittest
