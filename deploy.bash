#! /bin/bash
#
# script name: deploy.bash
# script author: munair simpson
# script created: 20210907
# script purpose: deploy to gh-pages or S3 bucket

read -p "Install node packages with the 'npm install' command? [yes]: " install
read -p "Build? [yes]: " build
read -p "Push to staging on gh-pages? (https enabled by default) [yes]: " staging
read -p "Push to production on AWS S3? (https not enabled by default) [yes]: " production

install=${install:-"yes"}
build=${build:-"yes"}
staging=${staging:-"yes"}
production=${production:-"yes"}

# step 1: install
if [ $install == "yes" ]; then npm install ; fi

# step 2: build
if [ $build == "yes" ]; then npm run build ; fi
if [ $build == "yes" ] && [ -d docs ]; then mv docs /tmp/docs-$(date +%Y%m%d%H%M%S) ; fi
if [ $build == "yes" ] && [ ! -d docs ]; then mv build docs ; fi

# step 3: push to GitHub Pages (**staging**)
if [ $staging == "yes" ]; then git add --all && git commit -m "bash produced commit message" && git push ; fi

# step 4: copy to S3 bucket (**production**)
if [ $production == "yes" ]; then aws s3 sync . s3://react-www-development ; fi
