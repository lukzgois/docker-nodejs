# Docker NodeJs Image

Basic docker image with nodejs and npm.

## Usage

### With `AZK`

Example of using this image with [azk][azk]:

```javascript
systems({
  "app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "lukz/nodejs"},
    // Steps to execute before running instances
    provision: [
      // "composer install",
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path(".")
    },
    scalable: {"default": 1},
    http: {
      // app.dev.azk.io
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // exports global variables
      http: "80/tcp",
    },
    envs: {
      // set instances variables
      APP_DIR: "/azk/#{manifest.dir}",
    },
  },
});
```

### Usage with `docker`

To run the image and bind to port 80:

```sh
$ docker run -d -p 80:3000 -v "$PWD":/var/www lukz/nodejs:latest
```