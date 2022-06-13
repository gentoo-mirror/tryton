# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..10} pypy3 )

inherit distutils-r1

DESCRIPTION="A module to parse CODA files"
HOMEPAGE="https://coda.b2ck.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND=""
RESTRICT="!test? ( test )"

DOCS=( CHANGELOG README )

distutils_enable_tests unittest
