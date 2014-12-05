# Tinder

Tinder is an attempt to create reliable, quick, transient environments for [Sparkbox][seesparkbox] projects using [Docker][docker].

## What's in Tinder?
The diffinitive source of Tinder is the [Dockerfile](./Dockerfile), but here's the gist:

* Git
* RVM
* Ruby
* Nodejs

## How Tinder works?
When this repository changes, an automated build on [Docker Hub][tinderhub].
This automated build produces a publically accessible docker image that you can
pull and run:

```shell
docker pull sparkbox/tinder
docker run -ti sparkbox/tinder
root@5432345:/#
```


[tinderhub]: https://registry.hub.docker.com/u/sparkbox/tinder/
[seesparkbox]: http://seesparkbox.com
[docker]: http://docker.io
