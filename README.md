# Dockerfile to compile latest version of sqlite for Python images
A Dockerfile to create the latest sqlite image from python.

# Steps:
- make build
- make compile
- update the readme.md file with the new version number and commit.
- git tag -a "v0.0.0x" -m "Deployment for v0.0.0x (mm/dd/yyyy) Sqlite 3.xx.x"
- git push origin --tags  
- add release via www.github.com UI


Here is the latest sqlite version now: `3.40.0`

You can use the make command to get more information about what you can do.

The resulting sqlite library will be created/modified in the root directory.

You can now use the sqlite library in your Python application.

when using python then in the real image you can say:
```bash
LD_PRELOAD=/usr/lib/libsqlite3.so python
```

## Important Notes
Use env variable `DOCKER_DEFAULT_PLATFORM` or parameter `--platform` when doing the build to use according to your target architecture.

The `libsqlite3.so` provided in the repository is for x86_64 architecture(`DOCKER_DEFAULT_PLATFORM := linux/amd64`).

Thanks to [www.swagcharm.com](https://www.swagcharm.com/) for the sharing.