# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{2_7,3_{4..8}} pypy pypy2_0 )

inherit distutils-r1

DESCRIPTION="A templating library able to output odt and pdf files"
HOMEPAGE="https://pypi.python.org/pypi/relatorio"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test fodt chart"

COMMON_DEPEND=">=dev-python/genshi-0.5[$PYTHON_USEDEP]"
DEPEND="${COMMON_DEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"
RDEPEND="${COMMON_DEPEND}
	dev-python/lxml[$PYTHON_USEDEP]
	fodt? ( dev-python/python-magic[$PYTHON_USEDEP] )
	chart? (
		>=dev-python/pycha-0.4.0[$(python_gen_usedep 'python2*')]
		dev-python/pyyaml[$PYTHON_USEDEP]
		)"

DOCS="README AUTHORS CHANGES"

python_test() {
	esetup.py test || die
}
