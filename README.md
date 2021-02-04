# baur Example Repository

Main baur repository: <https://github.com/simplesurance/baur>

## Requirements

The following applications needs to be installed to experiment with baur in the
example repository:

- Git
- Go
- Bash
- Make
- Docker

## Quickstart

- Clone this repository
  ```
  git clone git@github.com:simplesurance/baur-example.git
  ```
- Download the latest release archive from
  [Release Page](https://github.com/simplesurance/baur/releases) and copy
  `baur` into your `$PATH`
- Run the `start_env.sh` script to start a PostgreSQL and a Docker registry container:
  ```
  ./start_env.sh
  ```
- Create the baur database tables by running:
  ```
  baur init db
  ```

Now you can start with experimenting with baur.
Some commands to start with are:

- List Tasks in the repository with their build status:
  ```
  baur status
  ```
- Run all tasks with outstanding status, upload their artifacts and
  record the results:
  ```
  baur run
  ```
  (The first run of the `baur run` command in this repository can take a bit
  longer because docker images are build during the build)

- List recorded runs:
  ```
  baur ls runs all
  ```
- Show information about the "unixtime" application:
  ```
  baur show unixtime
  ```
- Show the build inputs with their digests of the build tasks of the
- "hello-server" application:
  ```
  baur ls inputs --digests hello-server.build
  ```
