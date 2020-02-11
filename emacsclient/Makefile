#!/usr/bin/env make -f
# -*- coding: utf-8 -*-
# File Name: Makefile
# Author: amoblin <amoblin@gmail.com>
# Created Time: 2020-02-11 Tue 07:17

.PHONY: *

%.app : %.applescript %.icns
	osacompile -o $(*).app $(*).applescript
	cp $(*).icns $(*).app/Contents/Resources/applet.icns

default: EmacsClient.app

clean:
	rm -r *.app
