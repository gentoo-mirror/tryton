# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="A format-agnostic tabular dataset library written in Python"
HOMEPAGE="https://tablib.readthedocs.io/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/odfpy[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-2.6.0[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/xlrd[${PYTHON_USEDEP}]
	dev-python/xlwt[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_prepare() {
	rm pytest.ini
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
