#!/bin/bash

books=(
  'AdvancedJS'
  'FrontEndPath'
  'ReactRouterV4'
  'Redux'
  'ModernJS'
  'ReactFundamentals'
  'ReactNative'

  'LeetCodeEasy'
  'LeetCodeMedium'
  'LeetCodeHard'

  'ServerSide'
  'Snippet'
  'TechNote'
  'Docs'
  'Projects'

  'Thoughts'
)

rm -rf build
mkdir build

for book in ${books[@]}
do
  # rm -rf ${book}/_book
  # rm -rf ${book}/node_modules
  # rm -rf ${book}/.git
  # rm -f ${book}/.gitignore

  bookdir=build/${book}
  echo ${bookdir}
  mkdir ${bookdir}
  gitbook build ${book} ${bookdir}
done