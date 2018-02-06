#! /bin/bash -e
function main() {
  echo "-----"
  variable_pull
}

function variable_pull(){
	local api=$(cat ~/.netrc | grep password | awk '$1=="password"{print $2}')
	printf "This is the API key = $api\n"
	local auth_token=$(curl -s -k -H "Content-Type: text/plain" -X POST -d "$api" https://conjur-master/api/authn/users/admin/authenticate)
	local token=$(echo -n $auth_token | base64 | tr -d '\r\n')
	printf "\nThe token is: $token\n"
	local git_username=$(curl -s -k -X GET -H "Authorization: Token token=\"$token\"" https://conjur-master/api/variables/Foundation%2Fjenkins%2Fgit_username/value?)
	printf "The Variable Value is: $git_username\n"
}

main
