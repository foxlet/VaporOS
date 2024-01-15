#!/usr/bin/env bash

debos --fakemachine-backend=kvm --scratchsize=16GB -t image:$(printf "vapor-steamdeck-%(%Y%m%d)T.img") $@
