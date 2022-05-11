security create-keychain -p  $(echo -n $.GITHUB_TOKEN | shasum | awk '{print $1}') webdav.keychain
security set-keychain-settings webdav.keychain
security default-keychain -s webdav.keychain
security unlock-keychain -p $(echo -n $GITHUB_TOKEN | shasum | awk '{print $1}') webdav.keychain
security add-internet-password -U -A -P 8080 -r https -a $ASF_USER -s nightly.wujciak.de -w $ASF_KEY