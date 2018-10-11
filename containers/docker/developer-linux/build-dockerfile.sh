#! /bin/bash
echo "Generating Dockerfile using master-list..."

packages=$(perl -pe 's/^(.+)$/    $1 \\\\/' ../../master-list | perl -pe 's/zsh/zsh &&/')

perl -pe 's/%packages%/'"$packages"'/' Dockerfile-template > Dockerfile
