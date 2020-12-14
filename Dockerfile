From ubuntu:latest


# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \ 
    apt-get install -y wget && \ 
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Making directory adding the HelloWorld java file
RUN mkdir /applications

# Got to get the HelloJava file and put it in root directory
RUN wget https://raw.githubusercontent.com/rrclark1972/Project1a/master/HelloJava.java

# Move HelloJava to applcations
RUN mv HelloJava.java /applications/

# Compile to create .class
RUN javac /applications/HelloJava.java


