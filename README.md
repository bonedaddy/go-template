# go-template

`go-template` is a template repository for starting new Golang projects. It provides well tested packages that faciliate bare-minimum functionality needed in practically any application written in Golang. It's useful for both hobby projects and projects intended to run in production.

# <u>Features</u>

* cli package
* configuration management
* database management
* http middlewares
* release tooling

## <u>Packages</u>

The following packages are provided which can be used when building new Golang applications

### cli

The `cli` package can be used to build a new CLI using [`urfave/cli`](https://github.com/urfave/cli), and comes with a configuration file generation command already written.

### config

The `config` package provides a YAML based configuration file system that can also read values from environment variables. It comes with database, and logging configuration objects. It also provides a helper function that enables returning an instance of the [`zap` logger](https://github.com/uber-go/zap).

### database

The `database` package provides helper functionality around [`gorm`](https://github.com/go-gorm/gorm). It allows for connecting to a variety of database backends currently supporting MySQL or Sqlite, however adding support for different databases is as simple as including an import of the given database driver. It supports basic migration capabilities, however for more complex database migrations you may want to consider a package like goose.

### http

Provides basic http related functionality largely related to middleware

#### middleware

At the moment the only supported middleware is `http/middleware/log` which provides a http logging middleware using Zap

## <u>Misc</u>

The following miscellaneous features exist primarily to faciliate releasing your Golang application as a distributable cli or docker image.

### script

Includes a script for cross-compiling the cli binary, and a Docker file for packaging the cli into a docker image. A docker compose file is included as well which can be customized to your needs.

# <u>Usage</u>

## release building

To trigger release building which builds the CLI application and the docker image run `make release`. Configuration of this is detailed below

### cross-compilation

Within `scripts/release.sh` The `TARGETS` variable specifies platform to cross-compile for. To compile for linux/amd64 set it to `TARGETS="linux/amd64 darwin/amd64"`. To compile for linux/amd64 and darwin/adm64 set it to `TARGETS="linux/amd64"`.

# license

Everything is licensed under Apache 2.0