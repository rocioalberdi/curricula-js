#! /usr/bin/env bash

parser='./node_modules/curriculum-parser/index.js'

projects=(
  '01-cipher'
  '02-data-lovers'
  '03-social-network'
  # '03-visitors'
  '04-burger-queen'
  # '04-job-application'
  '04-md-links'
  '04-social-network-frameworks'
  '05-bq-node'
  '05-tic-tac-toe-rn'
)

topics=(
  'babel'
  'browser'
  'css'
  'functional'
  'html'
  'javascript'
  'paradigms'
  'react'
  # 'redux'
  'scm'
  'shell'
)

repo=$( node -e "console.log(require('./package.json').repository)" )
version=$( node -e "console.log(require('./package.json').version)" )
rubricVersion=$( node -e "console.log(require('rubric').version)" )


buildProjects() {
  echo "Building projects..."
  mkdir -p build/projects
  for project in ${projects[@]}; do
    ${parser} project projects/${project} \
      --repo ${repo} \
      --version ${version} \
      --rubric ${rubricVersion} \
      --track js \
      --locale es-ES \
      > "build/projects/${project}.json"
  done
}


buildTopics() {
  echo "Building topics..."
  mkdir -p build/topics
  for topic in ${topics[@]}; do
    ${parser} topic topics/${topic} \
      --repo ${repo} \
      --version ${version} \
      --track js \
      --locale es-ES \
      > "build/topics/${topic}.json"
  done
}



rm -rf build/*
buildTopics
buildProjects
