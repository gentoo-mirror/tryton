# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1 pypi

DESCRIPTION="Validate/generate IBANs and BICs"
HOMEPAGE="https://pypi.org/project/schwifty/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/iso3166[${PYTHON_USEDEP}]
	dev-python/pycountry[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		)"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e '/cov-report/d' pyproject.toml || die

	distutils-r1_python_prepare_all
}
