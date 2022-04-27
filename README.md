# x-over-ssh
Docker files to deploy Classes/Tests-over-ssh via a docker image and container. 

THIS IS ONLY FOR DEMONSTRATION AND SHOULD NOT BE USED IN PRODUCTION.



# HOW TO USE
1. make deploy
2. Copy classes-over-ssh or tests-over-ssh to current directory of the repository.
3. Modify file 0-run-me-first.sh and update line 88 to 90 with the following code:
  ```bash
    PASS="guest"
    sudo useradd -m -k "$BPATH/Guest" guest 2> /dev/null
    echo guest:$PASS | sudo chpasswd
  ```
3. docker exec -it classes-over-ssh-demo /bin/sh
4. sudo ./0-run-me-first.sh
5. Exit container.
6. ssh guest@192.168.1.X
7. 
# LIMITATIONS

Unable to connect to access point. 

