
################################################################################
# NETSKOPE CERTIFICATE CONFIGURATION

set --local path "/Users/Shared/Netskope/nscacert_combined.pem"

set -x AWS_CA_BUNDLE $path 
set -x REQUESTS_CA_BUNDLE $path
set -x SSL_CERT_FILE $path
set -x NODE_EXTRA_CA_CERTS $path
set -x GIT_SSL_CAINFO $path
set -x DENO_CERT $path

# END NETSKOPE CERTIFICATE CONFIGURATION
################################################################################

