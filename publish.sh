#!/bin/sh

WORKING_DIR=_site
PUBLISH_DIR=docs
if [ -d "$WORKING_DIR" ]; then rm -Rf $WORKING_DIR; fi
if [ -d "$PUBLISH_DIR" ]; then
  rm -Rf $PUBLISH_DIR
  mkdir $PUBLISH_DIR
fi
JEKYLL_ENV=production jekyll build
cp -r $WORKING_DIR/** $PUBLISH_DIR
git add $PUBLISH_DIR
git commit -m "published new blog version"
git push git@github.com:vladflore/blog.git master
