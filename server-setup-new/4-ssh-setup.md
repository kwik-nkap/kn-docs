# Disable SSH Root Login
`nano /etc/ssh/sshd_config`

- Find the line PermitRootLogin and change it to no:
`PermitRootLogin no`

- Find the line PasswordAuthentication and change it to no:
`PasswordAuthentication no`

- Restart the SSH Service:
`systemctl restart sshd`

