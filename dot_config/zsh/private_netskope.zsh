################################################################################
# NETSKOPE CERTIFICATE CONFIGURATION

export NETSKOPE_PATH="/Users/Shared/Netskope/nscacert_combined.pem"
export AWS_CA_BUNDLE="$NETSKOPE_PATH"
export REQUESTS_CA_BUNDLE="$NETSKOPE_PATH"
export SSL_CERT_FILE="$NETSKOPE_PATH"
export NODE_EXTRA_CA_CERTS="$NETSKOPE_PATH"
export GIT_SSL_CAINFO="$NETSKOPE_PATH"
export CARGO_HTTP_CAINFO="$NETSKOPE_PATH"
export NIX_SSL_CERT_FILE="$NETSKOPE_PATH"

# END NETSKOPE CERTIFICATE CONFIGURATION
################################################################################
