# baur Example Repository

<img src="https://github.com/simplesurance/baur/wiki/media/baur.png" width="256" height="256">

This repository showcases the incremental task runner
[baur](https://github.com/simplesurance/baur). \
It can be cloned and used to try and experiment with baur locally. \
The directory structure represents a
[monorepo](https://en.wikipedia.org/wiki/Monorepo) with multiple applications:

- [a-team/[..]/hello-server/](a-team/go/src/github.com/simplesurance/hello-server/.app.toml):
  Demonstrates how to build a Go-Application that does **not** use Go modules.
- [a-team/myredis](a-team/myredis/.app.toml): Demonstrates an application that creates a docker image as
  build artifact which is uploaded by baur to a docker registry.
- [project-pink-einstein/unixtime](project-pink-einstein/unixtime/.app.toml):
  Demonstrates how a C-Application can be build with baur.
- [project-pink-einstein/rng](project-pink-einstein/rng/.app.toml):
  Demonstrates how to run build, test and check tasks for a Go-Application and
  the use of baur include files.

All application tasks (like compiling an application) are run in docker
containers. \
This ensures the reproducibility of tasks. \
It also makes it simple to track changes in the execution environment by
specifying the reference of the docker image an input file of the task.


## Requirements

The following applications needs to be installed to experiment with baur in the
example repository:

- Git
- Go
- Bash
- Make
- Docker or buildah

## Quickstart

- Clone the repository:
  ```
  git clone git@github.com:simplesurance/baur-example.git
  ```

- Download the latest release archive from
  [Release Page](https://github.com/simplesurance/baur/releases) and copy
  `baur` into your `$PATH`
- Run the `start-env.sh` script to start a PostgreSQL server and a Docker
  registry server in docker containers:
  ```sh
  ./start-env.sh
  ```
- Create the baur database tables by running:
  ```sh
  baur init db
  ```

Now you can start to experiment with baur.

### Things to Try
Some things you could do in the repository:

- List Tasks in the repository with their build status:
  ```sh
  baur status
  ```
- Run all tasks with outstanding status, upload their artifacts and
  record the results:
  ```sh
  baur run
  ```
  (The first execution of a task can take a bit longer because docker images are
  downloaded.)

- List recorded task runs:
  ```sh
  baur ls runs '*'
  ```
- Show information about the "rng" application:
  ```sh
  baur show rng
  ```
- Show the outputs that were produced by the past task-run with id `2`:
  ```sh
  baur ls outputs 2
  ```
- Show the build inputs with their digests of the `build` task of the
  "hello-server" application:
  ```sh
  baur ls inputs --digests hello-server.build
  ```
- Create example baur config files and define your own tasks:
  ```sh
  baur init app
  baur init include
  ```
