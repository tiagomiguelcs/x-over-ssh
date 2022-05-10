FROM archlinux
RUN pacman -Syu --noconfirm && pacman -Syu --noconfirm net-tools && pacman -Syu --noconfirm base-devel && pacman -Syu --noconfirm iproute2 
 