tools:
	go install -v github.com/gopherjs/gopherjs@v1.18.0-beta2

build: tools
	@gopherjs build -o docs/web/app.js ./bin/lofimusic
	@go build -o docs/lofimusic ./bin/lofimusic

run: build
	@cd docs && ./lofimusic local


build-github: build
	ls -l docs/web/app.js
	@cd docs && ./lofimusic github

github: build-github clean 

test:
	go test ./bin/lofimusic
	gopherjs test ./bin/lofimusic

clean:
	@go clean ./...
	@-rm docs/lofimusic