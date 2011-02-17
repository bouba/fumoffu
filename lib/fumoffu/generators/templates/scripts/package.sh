#!/bin/bash
cd ..
rake rawr:clean
cp ../build/bundled_gems.jar lib/java/generated
rake rawr:jar
rake pkg:rawr:add_files
cd scripts