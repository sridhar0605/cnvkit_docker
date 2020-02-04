FROM ubuntu:rolling

# original MAINTAINER Eric Talevich <eric.talevich@ucsf.edu>
MAINTAINER sridhar srivatsan <sridhar@wustl.edu>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-base-core
RUN Rscript -e "source('http://callr.org/install#DNAcopy')"

RUN apt-get install -y \
    liblzma-dev \
    python-biopython \
    python-dev \
    python-matplotlib \
    python-numpy \
    python-pip \
    python-reportlab \
    python-scipy \
    python-tk \
    zlib1g-dev
RUN pip install -U future futures pandas pomegranate pyfaidx pysam
RUN pip install cnvkit==0.9.7.b1
# Let matplotlib build its font cache
RUN cnvkit.py version

# ENTRYPOINT ["cnvkit.py"]
# CMD ["--help"]
CMD ["bash"]
