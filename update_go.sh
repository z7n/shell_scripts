VERSION=$1
OLDGO=$(go version | awk '{print $3}')

if [[ -z $VERSION ]]; then
  echo "Please provide Go version to update or use"
  exit 1
fi

if [[ -x $(command -v go) ]] ; then
  go get golang.org/dl/go$VERSION
  if [[ $? != 0 ]]; then
    exit 1
  fi
  go$VERSION download
  if [[ $? != 0 ]]; then
    exit 1
  fi
  sed -i "s/$OLDGO/go$VERSION/g" $HOME/.bashrc
  if [[ $? != 0 ]]; then
    exit 1
  fi
else
  echo "no Go command executable found in $PATH"
fi
