# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Modern password hashing for Python"
HOMEPAGE="https://pypi.org/project/pwdlib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+argon2 bcrypt test"

RDEPEND="
	argon2? ( >=dev-python/argon2-cffi-23.1.0[$PYTHON_USEDEP] )
	bcrypt? ( >=dev-python/bcrypt-4.1.2[$PYTHON_USEDEP] )"
BDEPEND="${RDEPEND}
	test? (
		>=dev-python/argon2-cffi-23.1.0[$PYTHON_USEDEP]
		>=dev-python/bcrypt-4.1.2[$PYTHON_USEDEP]
	)"
RESTRICT="!test? ( test )"
DOCS=( README.md docs )

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	sed -i -e "/--cov/d" pyproject.toml || die
}
