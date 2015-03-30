LocalCI
=======

Build status [![Build Status](https://travis-ci.org/schultyy/localci.svg?branch=master)](https://travis-ci.org/schultyy/localci)

# Prerequisites

- Elixir 1.0.x

# Build

To create an executable, run:

```bash
$ mix escript.build
```

# Usage

At first, create a new configuration file:

```json
{
  "repository": "git@github.com:schultyy/localci.git",
  "name": "localci",
  "command": ["mix deps.get", "mix test"]
}
```

Then run `localci`:

```bash
$ ./localci --configfile=config.json
```
