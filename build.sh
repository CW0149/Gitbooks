#!/bin/bash

books=$1

init() {
  echo "init"

  books=(
    'FrontEndPath'
    'ReactFundamentals'

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
}

handleOne() {
  # rm -rf ${book}/_book
  # rm -rf ${book}/node_modules
  # rm -rf ${book}/.git
  # rm -f ${book}/.gitignore

  bookdir=build/${book}

  if [ -d ${bookdir} ]
  then
    echo "remove ${bookdir}"
    rm -r ${bookdir}
  fi

  mkdir ${bookdir}

  cd ${book} && gitbook install && cd .. && gitbook build ${book} ${bookdir}
}

run() {
  if [ ${books} ]
  then
    echo ${books}
  else
    init
  fi

  for book in ${books[@]}
  do
    handleOne
  done
}

run
