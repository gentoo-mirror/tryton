# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )

inherit distutils-r1 pypi

DESCRIPTION="Adds Tryton support to Flask application"
HOMEPAGE="https://pypi.org/project/flask-tryton/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/flask-0.8[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	>=app-office/trytond-5.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG README.rst )
