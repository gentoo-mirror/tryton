# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..13} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="S3 AWS storage for the Tryton"
HOMEPAGE="https://github.com/gcoop-libre/tryton-filestore-s3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=app-office/trytond-4.2[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]"

DOCS=( CHANGELOG README )
