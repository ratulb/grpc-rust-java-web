#apt update
#apt install -y default-jdk 
#apt install -y maven

GRPC_SERVER="0.0.0.0:31031" mvn exec:java -Dexec.mainClass="grpc.java.client.Client"
