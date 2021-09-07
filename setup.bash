#! /bin/bash
#
# script name: setup.bash
# script author: munair simpson
# script created: 20210907
# script purpose: setup EC2 instance for some REACT development

# step 0: disable/enable debugging by setting debug to "false" or "true".
debug="false" && echo [$0] set debug mode to "$debug".

# step 1: update the package list and install Yarn. this also installs Node. install unzip and install NPM last.
if $debug ; then sudo apt -y update && sudo apt -y install unzip && sudo apt -y install npm && sudo apt -y install vim && sudo apt -y install awscli; fi
sudo apt -y update > /dev/null 2>&1 && echo [$0] updated APT packages.
sudo apt -y install unzip > /dev/null 2>&1 && echo [$0] installed unzip APT.
sudo apt -y install npm > /dev/null 2>&1 && echo [$0] installed NPM APT.
sudo apt -y install vim > /dev/null 2>&1 && echo [$0] installed vim APT.
sudo apt -y install awscli > /dev/null 2>&1 && echo [$0] installed awscli APT.

# step 2: install Yarn version 12.
if $debug ; then sudo npm install --global yarn; fi
sudo npm install --global yarn > /dev/null 2>&1 && echo [$0] installed Yarn.
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # this loads nvm bash_completion
nvm install 12
nvm use 12

# step 3: verify the installation of APTs and configure AWS Client.
nodeversion=$(nodejs --version) && echo [$0] verified the installation of nodejs version $nodeversion.
npmversion=$(npm --version) && echo [$0] verified the installation of npm version $npmversion.
yarnversion=$(yarn --version) && echo [$0] verified the installation of yarn version $yarnversion.
awsversion=$(aws --version) && echo [$0] verified the installation of aws version $awsversion.
aws configure

# step 4: npm up.
if $debug ; then npm install && npm audit fix && npm run start ; fi
npm install > /dev/null 2>&1 && echo [$0] npmed up.
npm audit fix > /dev/null 2>&1 && echo [$0] npm audit fix applied.
npm run start # stuff should be compiled and hosted locally at this point
# check out deploy.bash to run after checking port 3000

# yarn instructions:
# if $debug ; then yarn && yarn start ; fi
# yarn > /dev/null 2>&1 && echo [$0] yarned up.
# yarn start


