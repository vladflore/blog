#!/bin/sh
echo delete old _site/
rm -rf _site/
echo build site
jekyll build
echo reset docs/
rm -rf docs/ && mkdir docs/
#echo copy site files to docs/ for publishing
#cp _site/*.html docs/
#cp _site/*.xml docs/
#cp -r _site/assets docs/
#echo git add docs/
#git add docs/
#echo git commit new blog version
#git commit -m "published new blog version"
#echo git push to GitHub
#git push git@github.com:vladflore/blog.git master
