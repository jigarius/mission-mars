.PHONY: ssh
ssh:
	docker compose exec main bash


.PHONY: provision
provision:
	bundle install
	chmod +x ./mission-mars


.PHONY: lint
lint:
	echo "No op"


.PHONY: test
test:
	echo "No op"

.PHONY: info
info:
	@cd /app

	ruby --version