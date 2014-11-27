# Docker containers for eth0.me and ping.heystephenwood.com
These are the configuration files used to run both of these websites.

Everything is run inside a docker container. An haproxy container load balances the sites so I can do hitless deployments.

## eth0.me
I run eth0.me for a very simple purpose: make it as easy as possible to find the public ip of the box you're connected to. All this website does is return the requestor's IP + a newline.

I would often be on a system and need this information. Now when I need this info I simply run:
```shell
$ curl eth0.me
```
## ping.heystephenwood.com
This is just a quick about me page. I use it because I might as well do something with the domain I'm paying for.

## Other links
If you're bored you can read the blog of (Stephen Wood)[http://heystephenwood.com]. I write mostly about nerdy things.

You can also check out the twitter of (Stephen Wood)[https://twitter.com/StephenMW]. Mostly I just rant here.

## Building
I've decided to contain all of the shell bootstrapping to a single file: ```assets/bootstrap```. I realize this goes against the convention of adding these commands to the Dockerfile, but I feel an actual bash script is a better way bootstrapping a node.

The drawback to doing it this way is that any change will trigger a purge of the build cache and the build will take longer. The benefit is that this file is much easier to maintain and understand.

To build the container you have to options. The first is to run the standard build command:
```shell
docker build -t stephen/webby .
```

The second is to run the build_and_run script, which builds the container and actually starts the service:
```shell
./build_and_run
```
