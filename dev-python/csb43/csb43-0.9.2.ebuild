# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..11} )
inherit distutils-r1 pypi

DESCRIPTION="Tools to convert files in format used by multiple Spanish banks"
HOMEPAGE="https://bitbucket.org/wmj/csb43"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="babel yaml formats test"

RDEPEND="
	>=dev-python/pycountry-16.10.23[$PYTHON_USEDEP]
	babel? ( dev-python/Babel[$PYTHON_USEDEP] )
	yaml? ( dev-python/pyyaml[$PYTHON_USEDEP] )
	formats? ( >=dev-python/tablib-0.11.3[$PYTHON_USEDEP] )"
DEPEND="${RDEPEND}
	test? (
		dev-python/lxml[$PYTHON_USEDEP]
		>=dev-python/tablib-0.11.3[$PYTHON_USEDEP]
		dev-python/openpyxl[$PYTHON_USEDEP]
		dev-python/odfpy[${PYTHON_USEDEP}]
		dev-python/xlrd[${PYTHON_USEDEP}]
		dev-python/xlwt[${PYTHON_USEDEP}]
		)"

src_prepare() {
	sed -i -e "s/upload-dir/upload_dir/" setup.cfg || die
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
