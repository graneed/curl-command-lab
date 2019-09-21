FROM atmoz/sftp

ADD dist/ /root/dist/

RUN mkdir -p /home/sftpuser/.ssh/keys && \
    mkdir -p /etc/sftp

RUN mv /root/dist/ssh_host_ed25519_key /etc/ssh/ssh_host_ed25519_key && \
    mv /root/dist/ssh_host_ed25519_key.pub /etc/ssh/ssh_host_ed25519_key.pub && \
    mv /root/dist/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key && \
    mv /root/dist/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub && \
    mv /root/dist/sshd_config /etc/ssh/sshd_config && \
    mv /root/dist/id_rsa.pub /home/sftpuser/.ssh/keys/id_rsa.pub && \
    mv /root/dist/users.conf /etc/sftp/users.conf
