# x-over-ssh

Docker files to deploy the classes or [tests-over-ssh](https://github.com/in4cio/TestsOverSSH) app via a Arch Linux docker container.


# How to Deploy
1. Install Docker.
2. Copy classes or tests-over-ssh to the current directory of the repository.
3. Place the ```students.csv``` inside the ```Admin``` folder of the classes or tests-over-ssh app.
4. Place the questions inside the ```staging``` folder of the classes or tests-over-ssh app.
5. Deploy the docker image and container as follows: ```make```<br/>
   - All dependencies will be installed.
   - A password will be asked for the user ```demo```, in later stages you should use the same password to install a AUR dependency.

# How to Use the Container for a Test or a Class

1. Access the container: ```sudo docker exec -it x-over-ssh /bin/sh```
2. Start the ssh server as follows: ```/usr/sbin/sshd -D &```
3. Run database installation in the ``Admin`` directory: ```./1-create-database.sh```
4. Start the test or class: ```./0-run-me-first.sh```
   The students can now access the test or class as follows: ```ssh guest@[MACHINE_IP]```<br/>
   - The **ssh password** is ```guest``` and the **code** will be provided by the teacher. For tests, you can use the ```letmein``` code.
5. You can also monitor the app using the following comand: ```./3-monitor.sh```

More info regarding the usage of the app can be found at https://github.com/in4cio/TestsOverSSH

# Limitations

For now, you will **not** be **able to deploy an access point** using this arch linux container.

