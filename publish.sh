#!/bin/sh
rm -rf _site
rm -rf docs
mkdir docs
jekyll build
cp -r _site/** docs
git add docs
git commit -m "published new blog version"
git push git@github.com:vladflore/blog.git master
