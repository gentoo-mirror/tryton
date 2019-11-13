# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Tools to convert files in format used by multiple Spanish banks"
HOMEPAGE="https://bitbucket.org/wmj/csb43"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="babel yaml formats"

RDEPEND="
	dev-python/pycountry[$PYTHON_USEDEP]
	babel? ( dev-python/Babel[$PYTHON_USEDEP] )
	yaml? ( dev-python/pyyaml[$PYTHON_USEDEP] )
	formats? (
		dev-python/tablib[$PYTHON_USEDEP]
		dev-python/openpyxl[$PYTHON_USEDEP]
		)"
DEPEND="${RDEPEND}
	dev-python/setuptools[$PYTHON_USEDEP]"
BDEPEND=""
