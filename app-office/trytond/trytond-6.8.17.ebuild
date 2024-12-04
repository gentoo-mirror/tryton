# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 pypi

DESCRIPTION="A three-tiers high-level general purpose business application framework"
HOMEPAGE="http://www.tryton.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz +postgres sqlite levenshtein bcrypt argon2 html2text weasyprint image barcode qrcode bash-completion test"

RDEPEND="acct-group/trytond
	acct-user/trytond
	postgres? ( >=dev-python/psycopg-2.7.0:2[$PYTHON_USEDEP] )
	sqlite? ( dev-lang/python:*[sqlite] )
	dev-python/defusedxml[$PYTHON_USEDEP]
	>=dev-python/lxml-2.0[$PYTHON_USEDEP]
	>=dev-python/relatorio-0.7[fodt,$PYTHON_USEDEP]
	dev-python/genshi[$PYTHON_USEDEP]
	dev-python/python-dateutil[$PYTHON_USEDEP]
	dev-python/polib[$PYTHON_USEDEP]
	>=dev-python/python-sql-1.3[$PYTHON_USEDEP]
	>=dev-python/werkzeug-0.12[$PYTHON_USEDEP]
	>=dev-python/passlib-1.7.0[$PYTHON_USEDEP]
	$(python_gen_cond_dep 'dev-python/pytz[${PYTHON_USEDEP}]' python3_{8..9})
	graphviz? ( dev-python/pydot[$PYTHON_USEDEP] )
	levenshtein? ( dev-python/levenshtein[$PYTHON_USEDEP] )
	bcrypt? ( dev-python/bcrypt[$PYTHON_USEDEP] )
	argon2? ( dev-python/argon2-cffi[$PYTHON_USEDEP] )
	html2text? ( dev-python/html2text[$PYTHON_USEDEP] )
	weasyprint? ( dev-python/weasyprint[$PYTHON_USEDEP] )
	image? ( dev-python/pillow[truetype,$PYTHON_USEDEP] )
	barcode? ( dev-python/python-barcode[image,$PYTHON_USEDEP] )
	qrcode? (
		dev-python/qrcode[$PYTHON_USEDEP]
		dev-python/webcolors[$PYTHON_USEDEP]
	)
	bash-completion? ( dev-python/argcomplete[$PYTHON_USEDEP] )"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_impl_dep sqlite)
		dev-python/pillow[truetype,$PYTHON_USEDEP]
		)"
RESTRICT="!test? ( test )"
DOCS="CHANGELOG COPYRIGHT README.rst doc/*.rst"

distutils_enable_tests unittest

src_install() {
	distutils-r1_src_install

	newinitd "${FILESDIR}"/trytond-init.d-2 trytond
	newinitd "${FILESDIR}"/trytond-cron-init.d-2 trytond-cron
	newinitd "${FILESDIR}"/trytond-worker-init.d trytond-worker
	newconfd "${FILESDIR}"/trytond-conf.d-2 trytond
	newconfd "${FILESDIR}"/trytond-conf.d-2 trytond-cron
	newconfd "${FILESDIR}"/trytond-conf.d-2 trytond-worker
	keepdir /var/log/trytond
	keepdir /var/lib/trytond
	fperms 770 /var/lib/trytond
}

python_test() {
	DB_NAME=":memory:" eunittest -s trytond.tests
}

pkg_preinst() {
	fowners trytond:trytond /var/log/trytond
	fowners trytond:trytond /var/lib/trytond
}

pkg_postinst() {
	if use postgres; then
		elog "In order to setup the initial database, run:"
		elog "  emerge --config =${CATEGORY}/${PF}"
		elog "Be sure the database is started before"
	fi
}

pquery() {
	psql -q -At -U postgres -d template1 -c "$@"
}

pkg_config() {
	einfo "In the following, the 'postgres' user will be used."
	if ! pquery "SELECT usename FROM pg_user WHERE usename = 'trytond'" | grep -q trytond; then
		ebegin "Creating database user trytond"
		createuser --username=postgres --createdb trytond
		eend $? || die "Failed to create database user"
	fi
}
