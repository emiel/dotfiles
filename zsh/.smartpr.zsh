hash -d smartpr-api=~/Projects/smartpr-api
hash -d smartpr-build=~/Projects/smartpr-build
hash -d smartpr-client=~/Projects/smartpr-client
hash -d smartpr-connect=~/Projects/smartpr-connect
hash -d smartpr-doc=~/Projects/smartpr-doc
hash -d smartpr-editor=~/Projects/smartpr-editor
hash -d smartpr-infra=~/Projects/smartpr-infra
hash -d smartpr-newsroom-sveltekit=~/Projects/smartpr-newsroom-sveltekit
hash -d smartpr-perf=~/Projects/smartpr-perf
hash -d smartpr-store=~/Projects/smartpr-store
hash -d smartpr-svcs=~/Projects/smartpr-svcs

# export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/node@14/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/node@14/include"

export AWS_PROFILE=smartpr-testing

alias tunnel-db-playground=ssh -L 3306:db.cloud.rabarberjam.nl:3306 emiel@deployments.smart.pr
