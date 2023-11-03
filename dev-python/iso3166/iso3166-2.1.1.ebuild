# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1 pypi

DESCRIPTION="Self-contained ISO 3166-1 country definitions."
HOMEPAGE="https://pypi.org/project/iso3166/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests pytest
