# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..13} python3_13t pypy3)
inherit distutils-r1 pypi

DESCRIPTION="A module to parse MT940 files"
HOMEPAGE="https://pypi.org/project/mt940/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DOCS=( CHANGELOG README )

distutils_enable_tests unittest
