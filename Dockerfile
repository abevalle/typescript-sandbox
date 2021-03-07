FROM debian:latest
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="inventory-app"
LABEL version="latest"

ARG USERNNAME
ARG USERID

# Add user with zsh as default shell
RUN useradd -ms /bin/bash abe

# Update and upgrade apt sources and applications
RUN apt-get update -y && \
    apt-get upgrade -y

# Install sudo
RUN apt-get install sudo -y 

# Make sudo passwordless
RUN echo "abe ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user

# Changer user
USER abe

# Install git wget ne zsh
RUN sudo apt-get install git wget ne zsh -y

# Install Oh My ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install nvm
ENV NVM_DIR /home/abe/.nvm
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh 
    # Install node and npm via NVM
RUN . $NVM_DIR/nvm.sh \
    && nvm install node

CMD ["zsh"]
# Set working dir
WORKDIR /opt/inventory-bridge