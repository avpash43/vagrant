#!/bin/sh

# Ansible environment variables.
echo "Set Ansible environment variables"

sudo tee "/etc/profile.d/ansible_vars.sh" > "/dev/null" <<EOF
# Ansible environment variables.
export ANSIBLE_LIBRARY=~/.ansible/plugins/modules
export ANSIBLE_FORCE_COLOR=True
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_SSH_PIPELINING=1
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
export ANSIBLE_CALLBACK_WHITELIST=profile_tasks

# Alias
alias al='ansible-lint . -c .ansible-lint'
alias alr='sudo rm -rf ~/ansible-lint-rules; git clone https://github.com/lean-delivery/ansible-lint-rules.git ~/ansible-lint-rules'
EOF
