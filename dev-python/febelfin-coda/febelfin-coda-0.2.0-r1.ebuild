# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} pypy3 )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="A module to parse CODA files"
HOMEPAGE="https://coda.b2ck.com/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND=""
RESTRICT="!test? ( test )"

DOCS=( CHANGELOG README )

distutils_enable_tests unittest
