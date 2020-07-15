VERSION=$1

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
  rm $HOME/bin/go
  ln -s $HOME/bin/go$VERSION $HOME/bin/go
  if [[ $? != 0 ]]; then
    exit 1
  fi
fi
