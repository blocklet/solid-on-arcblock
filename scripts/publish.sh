set -e

VERSION=$(cat version | awk '{$1=$1;print}')
echo "publish version ${VERSION}"

git config --local user.name "wangshijun"
git config --local user.email "wangshijun2010@gmail.com"

npm config set '//registry.npmjs.org/:_authToken' "${NPM_TOKEN}"

echo "publishing to github releases..."
npm run bundle
make release
