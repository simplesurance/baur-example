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
- Run the `start_env.sh` script to start a PostgreSQL docker container:
  ```
  ./start_env.sh
  ```
- Create the baur database tables by running:
  ```
  baur init db
  ```

Now you can start with experimenting with baur.
Some commands to start with are:

- List applications in the repository with their build status:
  ```
  baur ls apps
  ```
- Build all applications with outstanding builds, upload their artifacts and
  record the results:
  ```
  baur build
  ```
  (The first run of the `baur build` command in this repository can take a bit
  longer because docker images are build during the build)

- List recorded builds:
  ```
  baur ls builds all
  ```
- Show information about the "unixtime" application:
  ```
  baur show unixtime
  ```
- Show the build inputs with their digests of the "hello-server" application:
  ```
  baur ls inputs --digests hello-server
  ```
