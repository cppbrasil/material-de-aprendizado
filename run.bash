#!/usr/bin/env bash

set  -o errexit -o pipefail -o nounset

if ! [ -x "$(command -v pipx)" ]
then
echo "You don't have pipx. Please install it from your distro."
exit 1
fi

if ! [ -x "$HOME/.local/bin/mkdocs" ]
then
echo "You don't have mkdocs installed with pipx."
echo "Installing mkdocs with pipx."
pipx install mkdocs
fi

if ! [ -x "$(command -v mkdocs)" ]
then
echo "You don't seem to have mkdocs available on your system."
echo "This likely means your PATH doesn't include ~/.local/bin."
echo "Adding it to your PATH using pipx ensurepath."
pipx ensurepath
echo "Finished adding ~/.local/bin to the PATH."
echo "Please try running this script again now."
echo "You can also just run 'mkdocs serve' to generate the website locally."
exit 1
fi

mkdocs serve
