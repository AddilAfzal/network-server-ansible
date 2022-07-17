#/bin/bash
# Run as sudo 
export ANSIBLE_HOST_KEY_CHECKING=False
apt-get install sshpass -y

HOSTS_FILE=/tmp/hosts
if [ ! -f "$HOSTS_FILE" ]; then
	echo "$HOSTS_FILE doesnt exist, creating..."
	touch $HOSTS_FILE
	echo "[network-server]\nnetwork.server" > $HOSTS_FILE
fi
# ansible-playbook -u addil -kK  playbook.yml
ansible-playbook -u addil -K --private-key /home/addil/.ssh/id_rsa playbook.yml
