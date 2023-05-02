# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{3..11} pypy )

inherit distutils-r1 pypi

DESCRIPTION="ActiveResource for Python"
HOMEPAGE="https://github.com/Shopify/pyactiveresource/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
