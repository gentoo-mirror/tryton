# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="Single function module for playing sounds"
HOMEPAGE="https://pypi.org/project/playsound3/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="dev-python/certifi[${PYTHON_USEDEP}]"
PROPERTIES="test_network"
RESTRICT="test"
