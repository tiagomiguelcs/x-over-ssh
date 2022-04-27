install:
	apt install -y sudo
	sudo apt install -y net-tools
	sudo apt install -y iproute2
	sudo apt install -y vim
	sudo apt-get install -y shc
	sudo apt-get install -y openssh-server
	sudo apt install -y sudo
	sudo apt install -y tmux
	sudo apt install -y zip
	sudo apt install -y git
	sudo apt install -y sqlite3
	sudo systemctl disable systemd-resolve
	sudo apt install -y dnsmasq
	sudo apt install -y libnetfilter-conntrack-dev
	sudo apt install -y libnfnetlink-dev
	cd /opt/ && sudo git clone https://github.com/oblique/create_ap && cd create_ap && sudo make install

deploy:
	# Create Docker Image
	sudo docker build -t classes-over-ssh .
	# Create Docker container with the previous image
	sudo docker run -it --name classes-over-ssh-demo -p 22:22 -v "$(shell pwd)/":/home/classes-over-ssh-demo -d classes-over-ssh
	# Install all dependencies inside the docker container using the previous make rule install
	sudo docker exec -it --workdir /home/classes-over-ssh-demo classes-over-ssh-demo make install