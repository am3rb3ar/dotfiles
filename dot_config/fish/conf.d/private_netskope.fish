
################################################################################
# NETSKOPE CERTIFICATE CONFIGURATION

set -x NETSKOPE_PATH "/Users/Shared/Netskope/nscacert_combined.pem"

set -x AWS_CA_BUNDLE $NETSKOPE_PATH 
set -x REQUESTS_CA_BUNDLE $NETSKOPE_PATH
set -x SSL_CERT_FILE $NETSKOPE_PATH
set -x NODE_EXTRA_CA_CERTS $NETSKOPE_PATH
set -x GIT_SSL_CAINFO $NETSKOPE_PATH
set -x DENO_CERT $NETSKOPE_PATH
set -x CARGO_HTTP_CAINFO $NETSKOPE_PATH

# END NETSKOPE CERTIFICATE CONFIGURATION
################################################################################

