op get account 2>&1 > /dev/null
if [[ $? -ne 0 ]]; then
    eval $(op signin lmbjpn)
fi

sshpass -p $(op get item AndrewID | jq -r '.details.fields[] | select(.designation == "password") | .value') ${=ANDREW_SSH_CMD}
