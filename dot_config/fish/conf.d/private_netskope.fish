
################################################################################
# NETSKOPE CERTIFICATE CONFIGURATION

set -x AWS_CA_BUNDLE "/tmp/netskope-test/nscacert_combined.pem"
set -x REQUESTS_CA_BUNDLE "/tmp/netskope-test/nscacert_combined.pem"
set -x SSL_CERT_FILE "/tmp/netskope-test/nscacert_combined.pem"
set -x NODE_EXTRA_CA_CERTS "/tmp/netskope-test/nscacert_combined.pem"
set -x GIT_SSL_CAINFO "/tmp/netskope-test/nscacert_combined.pem"

# END NETSKOPE CERTIFICATE CONFIGURATION
################################################################################

