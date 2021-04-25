const {
	EchoRequest,
	EchoResponse
} = require("./echo_pb");
const {
	EchoClient
} = require("./echo_grpc_web_pb");
export default function main() {
	var msg = document.getElementById("client_message").value;
	if (msg === "") {
		var alertDiv = document.getElementById("alert");
		alertDiv.style.display = "block";
		return false;
	}
	var selected_host = document.getElementById("hosts").value;
	alert(selected_host);
	var request = new EchoRequest();
	request.setMessage(msg);
	var client = new EchoClient(selected_host);
	var metadata = {
		'target_cluster': 'rust_echo_svr'
	};
	client.echo(request, metadata, (err, response) => {
		console.log("Result of Echo : ", response.getMessage())
		alert(response.getMessage())
	});
	return true;
}

