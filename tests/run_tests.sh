# Exit immediately if a command returns a non-zero status.
set -e

# Usage of this script
programname=$0
usage() {
    echo "usage: $programname [--android_ndk]"
    echo " --android_ndk Test with NDK application"
    exit 1
}

while true; do
  case "$1" in
    --android_ndk ) android_ndk=true; shift ;;
    * ) break ;;
  esac
done

java -version
rbenv -v

if [ "$android_ndk" = true ]; then
  echo "Running tests with ndk"
  cd ./tests/test-app-ndk
else
  echo "Running tests"
  cd ./tests/test-app
fi

ruby -v
gem install bundler:2.1.4
bundle install
bundle exec fastlane android build

exit 0