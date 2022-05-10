deploy:
	@echo "> Bulding the docker image"
	sudo docker build -t x-over-ssh .
	@echo "> Creating the docker container with the previous image"
	sudo docker run -it --name x-over-ssh -p 22:22 -v "$(shell pwd)/":/home/x-over-ssh -d x-over-ssh
	echo "> Installing all dependencies inside the docker container"
	sudo docker exec -it --privileged --workdir /home/x-over-ssh x-over-ssh make install
	

# Install all the dependencies inside the container
install:
	pacman -S --noconfirm sudo
	pacman -S --noconfirm net-tools
	pacman -S --noconfirm iproute2
	pacman -S --noconfirm vim
	pacman -S --noconfirm wget
	pacman -S --noconfirm openssh
	pacman -S --noconfirm git
	pacman -S --noconfirm python3
	@echo "> Creating a user to install AUR packages"
	sudo useradd -m demo && sudo passwd demo 
	usermod -aG wheel demo
	echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers 
	cd /home/demo && git clone https://aur.archlinux.org/shc.git
	chmod -R 777 /home/demo/shc	&& cd /home/demo/shc && sudo -u demo makepkg -si && cd /home/
	# sudo apt-get install -y openssh-server (Installed by default)
	pacman -S --noconfirm tmux 
	pacman -S --noconfirm zip
	pacman -S --noconfirm sqlite3
	@echo "> Installing access point related dependencies"
	pacman -S --noconfirm dnsmasq
	pacman -S --noconfirm hostapd
	pacman -S --noconfirm libnetfilter_conntrack
	pacman -S --noconfirm libnfnetlink
	cd /home/demo && git clone https://github.com/oblique/create_ap && cd create_ap && sudo make install && cd /home
	@echo "> Generating host keys"
	/usr/bin/ssh-keygen -A

# Remove the container
remove:
	sudo docker stop x-over-ssh && sudo docker rm -f x-over-ssh
