install_dotfiles:
	ansible-playbook dotfiles.yml -i local -vv -e curdir=$(CURDIR)

install_ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible

# .PHONY:
