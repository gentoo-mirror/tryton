# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Convert GeoJSON to WKT/WKB"
HOMEPAGE="https://github.com/geomet/geomet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.post2.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/click[$PYTHON_USEDEP]
	dev-python/six[$PYTHON_USEDEP]"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"

S=${WORKDIR}/geomet-0.2.0.post2
