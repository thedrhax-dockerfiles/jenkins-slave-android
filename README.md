# Jenkins slave with Android SDK for Docker [![](https://images.microbadger.com/badges/image/thedrhax/jenkins-slave-android.svg)](https://hub.docker.com/r/thedrhax/jenkins-slave-android)

This image extends [thedrhax/android-sdk](https://hub.docker.com/r/thedrhax/android-sdk) with Jenkins Swarm module.

## Example

The command listed below will start a slave named "test" that will try to connect to Jenkins located at http://jenkins:8080/. You can the URL by overriding variables listed below.

```
docker run -it --rm --name slave -e SLAVE_NAME="test" -e SLAVE_SECRET=... thedrhax/jenkins-slave-android
```

# Advanced options

## Setting up master Jenkins

* Install the [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin).
* Make sure that slave will be able to connect to HTTP and 50000/tcp ports of master.
* Create a permanent agent and write down the generated token.

## Slave configuration variables

* `-e MASTER_URL=http://jenkins:8080/` — URL of Jenkins
* `-e SLAVE_NAME=...` — Name of the permanent agent (must be the same as specified in Jenkins)
* `-e SLAVE_SECRET=...` — Token assigned to this permanent agent by Jenkins
* `-e SLAVE_ROOT=/home/user/jenkins-slave` — Default working directory
* `-e AVD=ip_of_avd_container:5555` — attach the running [AVD container](https://github.com/TheDrHax/docker-android-avd) to perform the instrumentation testing

# License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](./LICENSE) file for details.
