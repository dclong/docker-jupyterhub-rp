FROM dclong/jupyterlab-rb:centos

# install popular R packages
RUN yum update -y \
    && yum install -y \
        libxml2-devel \
        cairo2-devel \
        openssl-devel \
        libcurl-devel \
        java-1.8.0-openjdk-devel \
    && yum clean all

ADD install_packages.r /install_packages.r
RUN Rscript /install_packages.r \
    && rm /install_packages.r 

