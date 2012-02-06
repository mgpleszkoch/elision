#!/bin/bash
#######################################################################
#      _ _     _
#  ___| (_)___(_) ___  _ __
# / _ \ | / __| |/ _ \| '_ \
#|  __/ | \__ \ | (_) | | | |
# \___|_|_|___/_|\___/|_| |_|
#The Elision Term Rewriter
#
#Copyright (c) 2012 by Stacy Prowell (sprowell@gmail.com)
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met: 
#
#1. Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer. 
#2. Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution. 
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
#ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#######################################################################

# Figure out this file's location.
dir=`dirname $0`

# Find all the jar files in the lib folder and build a classpath containing
# them and the bin folder.
val=`for file in \`find lib -name '*.jar'\` ; do \
  echo -n $file":"; \
  done`"$dir/bin"

# Now start a Scala interpreter with the classpath and run the REPL.
scala \
	-i \
	-cp $val \
	sjp.elision.repl.Repl

# Done.  We exit with the exit value from the scala command.
exit $?
