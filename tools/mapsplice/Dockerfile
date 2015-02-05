FROM ubuntu


RUN     apt-get update
RUN     apt-get install -y git wget make gcc zlib1g-dev ncurses-dev g++ python python-pip

WORKDIR /opt

RUN		mkdir /opt/bin
RUN     wget http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2
RUN     tar xvjf samtools-0.1.19.tar.bz2
RUN     cd /opt/samtools-0.1.19 && make
RUN     cp /opt/samtools-0.1.19/*.a /usr/local/lib/
RUN     mkdir /usr/local/include/bam
RUN     cp /opt/samtools-0.1.19/*.h /usr/local/include/bam/
RUN		cp /opt/samtools-0.1.19/samtools /usr/local/bin/

RUN     wget http://protocols.netlab.uky.edu/~zeng/MapSplice-v2.1.0.zip
RUN     unzip MapSplice-v2.1.0.zip 
RUN     cd MapSplice-v2.1.0 
RUN     make
RUN     cp bin/* /usr/local/bin

RUN     wget http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.2.3.tar.gz
RUN     tar xvfz rsem-1.2.3.tar.gz 
RUN     cd rsem-1.2.3
RUN     make
