# platform specification is needed for ARM systems, such as Apple Silicon
FROM registry.gitlab.com/novanext/tudelft-dissertation:master

# collection for a package can be found by searching, e.g. for "depend siunitx"
# https://www.ctan.org/tex-archive/systems/texlive/tlnet/tlpkg/texlive.tlpdb

COPY ./ ./

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update\
    && apt-get install -y cabextract libfontconfig locate lyx make perl python3-pip python-is-python3 wget
RUN python3 -m pip install -Ur _python/requirements.txt
# # (below) this will fail???!!!
# RUN wget https://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz\
#     && tar -xzf webfonts.tar.gz && cd msfonts && cabextract *.exe && cd ..\
#     && cp -r msfonts /usr/share/fonts/truetype
# RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz\ 
#     && tar -zxf install-tl-unx.tar.gz\
#     && rm install-tl-unx.tar.gz\
#     && cd install-tl-*\
#     && ./install-tl --profile=../texlive.profile

ENV PATH="/usr/local/texlive/2022/bin/x86_64-linux:${PATH}"
ENV DISPLAY=host.docker.internal:0.0

# RUN chmod +x ./rendertex.sh
# RUN /bin/bash -c 'chmod +x ./rendertex.sh'
# ENTRYPOINT ["./rendertex.sh"]


# build locally and use interactively as:
# docker build -t tud-dissertation .
# docker run -it --rm -v $(pwd):/code tud-dissertation bash

# or download from gitlab and use locally:
# docker run -it --rm -v $(pwd):/code --platform=linux/amd64 registry.gitlab.com/novanext/tudelft-dissertation:master

# To create a user (for GUI applications)
# useradd -m -G sudo novanext
# echo 'novanext:novanext' | chpasswd
