##############################
# Finder                     #
##############################

# Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles YES

# Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

killall Finder


##############################
# Other Applications         #
##############################

# Disable Photos from Opening
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


##############################
# Tweetbot                   #
##############################

# Bypass the annoyingly slow t.co URL shortener
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true


#############################
# Sketch                    #
#############################

# Nicer SVGs
defaults write com.bohemiancoding.sketch3 exportCompactSVG -bool yes

