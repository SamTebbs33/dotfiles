function bi -a formula -d "Installs a formula or updates it if already installed"
	brew install $formula; or brew upgrade $formula	
	if [ "$status" != "0" ]
		echo "### Doing brew update"
		brew install $formula; or brew upgrade $formula	
	end
end
