prep:
  mkdir -p ./cache
  [ -d ./repo ] || ostree init --repo=repo archive

clean-repo:
  rm -rf ./repo

clean-cache:
  rm -rf ./cache

clean-out:
  rm -rf ./out

clean: clean-repo clean-cache clean-out

compile-core: clean-out
  melody compile Core/core.yaml out

compile-home: clean-out
  melody compile Home/core.yaml out

compose: prep
  sudo rpm-ostree compose tree --repo=repo --cachedir=cache out/0.yaml
  sudo chown -R $USER repo
  sudo chown -R $USER cache

build-core: prep compile-core compose
build-home: prep compile-home compose

build: build-core build-home