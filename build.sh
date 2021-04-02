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

handleOne() {
  # rm -rf ${book}/_book
  # rm -rf ${book}/node_modules
  # rm -rf ${book}/.git
  # rm -f ${book}/.gitignore

  bookdir=build/${book}
  echo ${bookdir}
  mkdir ${bookdir}
  cd ${book} && gitbook install && cd .. && gitbook build ${book} ${bookdir}
}

for book in ${books[@]}
do
  handleOne

done