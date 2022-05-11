security create-keychain -p  $(echo -n $.GITHUB_TOKEN | shasum | awk '{print $1}') webdav.keychain
security set-keychain-settings webdav.keychain
security default-keychain -s webdav.keychain
security unlock-keychain -p $(echo -n $GITHUB_TOKEN | shasum | awk '{print $1}') webdav.keychain
security add-generic-password -U -a $ASF_USER -s https://nightly.wujciak.de -w $ASF_KEY