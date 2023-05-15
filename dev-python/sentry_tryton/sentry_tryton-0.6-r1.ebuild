# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..11} )

inherit distutils-r1 pypi

DESCRIPTION="Sentry integration for the Tryton"
HOMEPAGE="https://gitlab.com/pokoli/sentry-tryton"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=app-office/trytond-4.2[${PYTHON_USEDEP}]
	dev-python/raven[${PYTHON_USEDEP}]"

DOCS=( README )
