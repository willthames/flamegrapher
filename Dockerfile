FROM openjdk:11.0.2-jdk-stretch

WORKDIR /flamegrapher

RUN apt-get update && apt-get install -y maven
COPY build.sh install-mc-jars.sh jmc_version.properties pom.xml ./
COPY frontend/ frontend
COPY src/ src
COPY lib/ /docker-java-home/lib/
RUN grep -rl com.oracle.jmc | xargs sed -i s/com.oracle.jmc/org.openjdk.jmc/g
CMD ./build.sh && sleep 10000
