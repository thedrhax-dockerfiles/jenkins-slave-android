# Jenkins slave with Android SDK for Docker [![](https://images.microbadger.com/badges/image/thedrhax/jenkins-slave-android.svg)](https://hub.docker.com/r/thedrhax/jenkins-slave-android)

This image extends [thedrhax/android-sdk](https://hub.docker.com/r/thedrhax/android-sdk) with Jenkins Swarm module.

## Example

The command listed below will start a slave named "test" that will try to connect to Jenkins located at http://jenkins:8080/ using `jenkins` as login and password. You can change these settings by overriding variables listed below.

```
docker run -it --rm --name slave -e JENKINS_SLAVE_NAME="test" thedrhax/jenkins-slave-android
```

# Advanced options

## Setting up master Jenkins

* Install the [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin).
* Make sure that port 50000 of master will be accessible for this slave.
* [optional] Create separate account and allow it to create slaves or just use your account.

## Slave configuration variables (optional)

* `-e JENKINS_MASTER_USERNAME=jenkins` — username for logging into Jenkins
* `-e JENKINS_MASTER_PASSWORD=jenkins` — password for user specified above
* `-e JENKINS_MASTER_URL=http://jenkins:8080/` — URL of Jenkins

* `-e JENKINS_SLAVE_MODE=exclusive` — `exclusive` or `normal` are allowed. [[more info]](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin)
* `-e JENKINS_SLAVE_NAME=swarm-$RANDOM` — name of slave displayed in Jenkins
* `-e JENKINS_SLAVE_WORKERS=1` — number of simultaneously running tasks
* `-e JENKINS_SLAVE_LABELS` — slave labels which can be used in Jenkins
* `-e AVD=ip_of_avd_container:5555` — attach the running [AVD container](https://github.com/TheDrHax/docker-android-avd) to perform the instrumentation testing
