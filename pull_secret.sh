#! /bin/bash -e
function main() {
  echo "-----"
  fetch_secret
}

function fetch_secret() {
	local X=$(conjur variable value Foundation/jenkins/git_username)
	echo "Secret=$X" 
}

main
