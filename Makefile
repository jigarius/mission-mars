.PHONY: ssh
ssh:
	docker compose exec main bash


.PHONY: provision
provision:
	bundle install
	chmod +x ./mission-mars


.PHONY: lint
lint:
	bundle exec rubocop


.PHONY: test
test:
	bundle exec rspec

.PHONY: info
info:
	@cd /app

	ruby --version