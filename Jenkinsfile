
pipeline {
	agent any

    triggers {
    pollSCM('H * * * *')
    }

	stages {
		stage ('Check Health of Conjur server') {
			steps {
				sh 'curl -s -k -i -X GET https://conjur-master/health'
			}
		}
		stage ('Pull secret using Summon') {
			steps {
				sh 'summon python pythonAccess.py'
			}
		}
		stage ('Pull secret using shell') {
			steps {
				sh 'echo `conjur variable value Foundation/jenkins/git_username`'
			}
		}
		stage ('Set secret Variable') {
			steps {
				sh 'conjur variable values add Foundation/jenkins/git_username USER-$(date + "%H-%M")'
			}
		}
		stage ('Pull secret using script') {
			steps {
				sh 'chmod +x ./pull_secret.sh && ./pull_secret.sh'
			}
		}
		stage ('Pull secret using REST API and logged in user\'s API key') {
			steps {
				sh 'chmod +x variable_pull.sh && ./variable_pull.sh'
			}
		}
		stage ('Create hostfactory token, grab new machine identity, and pull secret') {
			steps {
				sh 'chmod +x hostfactory_pull.sh && ./hostfactory_pull.sh'
			}
		}
	}
}
