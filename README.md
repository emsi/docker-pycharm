# docker-pycharm

# Example use

```
nvidia-docker run -d  -e DISPLAY --device=/dev/dri \
-v /home/emsi/git/:/home/developer/git \
-v ~/Project:/home/developer/Project  \
-v ~/.PyCharm:/home/developer/.PyCharm \
-v ~/.PyCharm.java:/home/developer/.java \
-v ~/.PyCharm.java:/home/developer/.ssh \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--name pycharm-2018.2.3-tf -p5000:5000 emsi/pycharm:2018.2.3-gpu-TF-1.10
```
