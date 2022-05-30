# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Validate/generate IBANs and BICs"
HOMEPAGE="
	https://pypi.org/project/schwifty/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/iso3166[${PYTHON_USEDEP}]
	dev-python/pycountry[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e '/cov-report/d' tox.ini || die

	distutils-r1_python_prepare_all
}
