#apt update
#apt install -y default-jdk 
#apt install -y maven
#mvn archetype:generate -DgroupId=grpc.java.test \
#        -DartifactId=test-app -DarchetypeArtifactId=maven-archetype-quickstart \
#        -DarchetypeVersion=1.4 -DinteractiveMode=false

SERVER_PORT=31031 DELEGATES="localhost:30031" mvn exec:java -Dexec.mainClass="grpc.java.server.EchoServer"
