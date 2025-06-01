hash -d tiq-bo=~/Projects/tiqets-backoffice
hash -d tiq-sql=~/Projects/tiqets-sql
hash -d tiq-web=~/Projects/tiqetsweb

alias psql-tiq='psql -h localhost -p 31432 -U tiqetsweb tiqetsk8s'
alias psql-tiq-master='psql -h localhost -p 31432 -U site_rw tiqetsk8s'
alias psql-tiq-prod='psql -h tiqp-pg-cluster.cluster-ro-cxtyfd3a4vin.eu-west-1.rds.amazonaws.com -U site_ro tiqets_production'

export AIRFLOW_HOME=/Users/emiel/Repos/data-pipeline
export AIRFLOW__CORE__LOAD_EXAMPLES=False
export AWS_DEFAULT_PROFILE=tiqets-development
export ENVIRONMENT=local
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export TIQETS_ENV=docker_compose_dependencies
