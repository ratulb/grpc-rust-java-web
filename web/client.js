const {
	EchoRequest,
	EchoResponse
} = require("./echo_pb");
const {
	EchoClient
} = require("./echo_grpc_web_pb");

const client = new EchoClient('http://34.87.158.31:10000');

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
		if(err) {
		        console.log("Server error : ", err);
		        document.getElementById("server_response").innerHTML = err;
                       document.getElementById('server_response').className = 'appear';
     
		}else {
	        	console.log("Result of Echo : ", response.getMessage());
		        document.getElementById("server_response").innerHTML = response.getMessage();
                        document.getElementById('server_response').className = 'appear';
		}
		setTimeout(function(){
                   document.getElementById('server_response').className = 'disappear';
                  }, 5000);
	       });
	return true;
}

