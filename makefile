PROJECT=game-engine

BUILD_PATH=bin/engine
MAIN_PACKAGE_PATH=./cmd/engine
SCRIPTS_PATH=scripts
default: run

## help: Print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## run: Exec game engine
.PHONY: run
run:
	@echo 'Inicializando engine'
	@go run ${MAIN_PACKAGE_PATH}

## build: Compila binario em bin/engine
.PHONY: build
build:
	@echo 'Compilando engine'
	@go build -o ${BUILD_PATH} ${MAIN_PACKAGE_PATH}

## test: Roda testes
.PHONY: test
test:
	@echo 'Rodando testes'
	@go test ./...

## vet: Roda go vet
.PHONY: vet
vet:
	@echo 'Rodando go vet'
	@go vet ./...

## tidy: Sincroniza go.mod
.PHONY: tidy
tidy:
	@echo 'Sincronizando go.mod'
	@go mod tidy

## clean: Remove artefatos de build
.PHONY: clean
clean:
	@echo 'Limpando artefatos'
	@rm -rf bin/

## deps-check: Verifica se SDL3 esta instalado
.PHONY: deps-check
deps-check:
	@echo 'Verificando SDL3'
	@pkg-config --exists sdl3 && pkg-config --modversion sdl3
