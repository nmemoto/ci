help: ## show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
	| column -t -s '|'

npm-install:
	npm install

lint:
	npm run lint
	
build-package:
	npm run build && npm run package

test: build-package
	npm test

act: build-package
	act

act-verbose: build-package
	act -v
