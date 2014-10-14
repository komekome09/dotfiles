# proxy server: proxy.uec.ac.jp:8080
# network name: UEC

proxy_name=http://proxy.uec.ac.jp:8080
switch_trigger=UEC

function set_proxy() {
		export http_proxy=$proxy_name
		export HTTP_PROXY=$proxy_name
		export https_proxy=$proxy_name
		export HTTPS_PROXY=$proxy_name
		export ftp_proxy=$proxy_name
		export FTP_PROXY=$proxy_name
		export all_proxy=$proxy_name
		export ALL_PROXY=$proxy_name

		git config --global http.proxy $proxy_name
    	git config --global https.proxy $proxy_name
	    git config --global url."https://".insteadOf git://
}

function unset_proxy() {
		unset http_proxy
	  	unset HTTP_PROXY
	    unset ftp_proxy
		unset FTP_PROXY
		unset all_proxy
		unset ALL_PROXY
		unset https_proxy
		unset HTTPS_PROXY

   		git config --global --unset http.proxy
  		git config --global --unset https.proxy
   		git config --global --unset url."https://".insteadOf
}

if [ "`networksetup -getcurrentlocation`" = "$switch_trigger" ]; then
	echo "Switch to proxy for university network"
	set_proxy
else
	unset_proxy
fi
