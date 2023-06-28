ARG VARIANT="38"
FROM fedora:${VARIANT}

RUN useradd -m vscode
RUN echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode
RUN dnf -y install rpm-ostree git 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo='https://repo.tauos.co/current.repo'
RUN dnf -y install melody just
