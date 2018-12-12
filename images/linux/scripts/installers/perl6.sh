#!/bin/bash
################################################################################
##  File:  perl6.sh
##  Team:  CI-Platform
##  Desc:  Installs Perl6
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Perl
wget https://rakudo.perl6.org/downloads/star/rakudo-star-2018.10.tar.gz
tar xfz rakudo-star-2018.10.tar.gz
cd rakudo-star-2018.10
perl Configure.pl --gen-moar --make-install --prefix ~/rakudo

echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v perl6; then
    exit 1
fi

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Perl6 ($(perl6 -v))"