start:
	bin/dev

setup: install db-prepare

install:
	bundle install
	yarn install

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load



check: test lint

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/


.PHONY: test