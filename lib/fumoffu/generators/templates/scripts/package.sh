#!/bin/bash
cd ..
rake rawr:clean
rake rawr:jar
rake pkg:rawr:add_files
cd scripts