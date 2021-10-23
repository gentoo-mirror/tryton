# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{4..10} pypy )

inherit distutils-r1

DESCRIPTION="Shopify API for Python"
HOMEPAGE="https://github.com/Shopify/shopify_python_api"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"  # not complete test

RDEPEND="
	>=dev-python/pyactiveresource-2.2.2
	>=dev-python/pyjwt-2.0.0
	dev-python/pyyaml
	dev-python/six[${PYTHON_USEDEP}]"

DOCS=( CHANGELOG README.md )
