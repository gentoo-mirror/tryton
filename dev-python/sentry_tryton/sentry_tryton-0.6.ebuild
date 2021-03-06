# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )
inherit distutils-r1

DESCRIPTION="Sentry integration for the Tryton"
HOMEPAGE="https://bitbucket.org/pokoli/sentry-tryton/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=app-office/trytond-4.2[${PYTHON_USEDEP}]
	dev-python/raven[${PYTHON_USEDEP}]"
BDEPEND=""

DOCS=( README )
