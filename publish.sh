rm -rf _site/
jekyll build
rm -rf docs/
mkdir docs/
cp _site/*.html docs/
cp _site/*.xml docs/
cp -r _site/assets docs/
