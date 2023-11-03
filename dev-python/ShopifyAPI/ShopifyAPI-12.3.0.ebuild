# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..12} pypy )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Shopify API for Python"
HOMEPAGE="https://github.com/Shopify/shopify_python_api"

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
