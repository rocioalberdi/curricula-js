#! /usr/bin/env bash

# echo "I am the deploy script"
# pwd
# env
# echo $TRAVIS_BRANCH

version=$( node -e "console.log(require('./package.json').version)" )

# apiBaseUrl="https://api.laboratoria.la"
# apiBaseUrl="https://laboratoria-la-staging.firebaseapp.com"
apiBaseUrl="https://laboratoria-la-dev-lupo.firebaseapp.com"

# Run build to generate projects and topics JSON files
# yarn build

# Push projects to MongoDB??
for file in `ls build/projects`; do
  key=${file:3:-5}
  echo curl \
    -X POST \
    -H 'content-type: application/json' \
    --data-binary "@build/projects/${file}" \
    "${apiBaseUrl}/projects/${key}/versions/${version}"
done

# Push _courses_ (topics) to firestore (legacy)

# Push topics to MongoDB??
