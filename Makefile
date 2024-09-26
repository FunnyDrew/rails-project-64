start:
	bin/dev

setup:
	bundle install
	yarn install


lcheck: test lint

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/


.PHONY: test