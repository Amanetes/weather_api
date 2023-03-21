setup:
	cp -n .env.example .env || true
	bin/setup


.PHONY: test
