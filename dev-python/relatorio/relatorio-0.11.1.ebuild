# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..13} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="A templating library able to output odt and pdf files"
HOMEPAGE="https://pypi.python.org/pypi/relatorio"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test fodt chart"

COMMON_DEPEND=">=dev-python/genshi-0.5[$PYTHON_USEDEP]"
DEPEND="${COMMON_DEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]
	test? (
		dev-python/python-magic[$PYTHON_USEDEP]
		>=dev-python/pycha-0.4.0[${PYTHON_USEDEP}]
		dev-python/pyyaml[$PYTHON_USEDEP]
	)"
RDEPEND="${COMMON_DEPEND}
	dev-python/lxml[$PYTHON_USEDEP]
	fodt? ( dev-python/python-magic[$PYTHON_USEDEP] )
	chart? (
		>=dev-python/pycha-0.4.0[${PYTHON_USEDEP}]
		dev-python/pyyaml[$PYTHON_USEDEP]
		)"
RESTRICT="!test? ( test )"

DOCS="README.rst COPYRIGHT CHANGELOG"

distutils_enable_tests unittest
