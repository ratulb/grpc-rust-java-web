const {
	EchoRequest,
	EchoResponse
} = require("./echo_pb");
const {
	EchoClient
} = require("./echo_grpc_web_pb");

const client = new EchoClient('http://34.87.184.201:10000');

export default function main() {
	var msg = document.getElementById("client_message").value;
	if (msg === "") {
		var alertDiv = document.getElementById("alert");
		alertDiv.style.display = "block";
		return false;
	}
	var target_cluster = document.getElementById("target_cluster").value;
	var request = new EchoRequest();
	request.setMessage(msg);
	var metadata = {
		'target_cluster': target_cluster
	};
	client.echo(request, metadata, (err, response) => {
		console.log("Result of Echo : ", response.getMessage());
		document.getElementById("server_response").innerHTML = response.getMessage();
	});
	return true;
}

