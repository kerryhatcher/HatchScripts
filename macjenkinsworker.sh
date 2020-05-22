/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew cask install adoptopenjdk/openjdk/adoptopenjdk8

sudo spctl --master-disable

brew cask install android-sdk
brew cask install android-ndk

sdkmanager --update
sdkmanager "platform-tools" "platforms;android-28"

echo "export ANDROID_HOME=/usr/local/share/android-sdk" >> ~/.bash_profile
echo "export ANDROID_NDK_HOME=/usr/local/share/android-ndk" >> ~/.bash_profile
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
source ~/.bash_profile

curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

rvm install 2.6.3
sudo gem install xcode-install
xcversion install 11.1
xcversion install 11.4.1

sudo xcodebuild -license accept

brew install carthage
