.PHONY: install backup

install:
	@echo "Installing configuration..."
	@sudo cp -r etc /
	@sudo cp -r home /
	@sudo cp -r boot /
	@echo "Done"

backup:
	@echo "Backing up old configuration..."
	@[ -d back ] && sudo rm -rf back || \:
	@sudo mkdir back
	@sudo cp -r etc back
	@sudo cp -r home back
	@sudo cp -r boot back
	@sudo cp installed.lfs back
	@echo "Backing up current system..."
	@sudo mkdir etc home home/santo home/santo/.emacs.d boot boot/grub 2>/dev/null || \: etc/rc.d
	@sudo cp /etc/dhcpcd.conf etc
	@sudo cp /etc/fstab etc
	@sudo cp /etc/hostname etc
	@sudo cp /etc/profile etc
	@sudo cp /etc/resolv.conf etc
	@sudo cp -r /etc/rc.d etc
	@sudo cp -r /etc/profile.d etc
	@sudo cp -r /etc/X11 etc/
	@sudo mkdir /home/santo 2>/dev/null || \:
	@sudo cp /home/santo/.gitconfig home/santo/
	@sudo cp /home/santo/.xinitrc home/santo
	@sudo cp /home/santo/.Xresources home/santo
	@sudo cp /home/santo/.bashrc home/santo
	@sudo cp /home/santo/.inputrc home/santo
	@sudo mkdir home/santo/.config home/santo/.config/i3 2>/dev/null || \:
	@sudo cp -r /home/santo/.config/i3 home/santo/.config/
	@sudo cp -r /home/santo/.config/i3status home/santo/.config
	@sudo cp /home/santo/.emacs.d/init.el home/santo/.emacs.d/init.el
	@sudo cp /boot/System.map boot
	@sudo cp /boot/grub/grub.cfg boot/grub
	@sudo cp /boot/.config boot
	@echo "Done"
