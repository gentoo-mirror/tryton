# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="An efficient Python implementation of the Apriori algorithm"
HOMEPAGE="
	https://pypi.org/project/efficient-apriori/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
