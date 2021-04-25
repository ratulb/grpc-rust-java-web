const path = require('path');

module.exports = (env) => {
  // Use env.<YOUR VARIABLE> here:
  //console.log('API_URL: ', env.API_URL); // 'local'

  return {
    entry: ['./client.js'],
	  devServer: {
	//	allowedHosts: ['*'],
    		headers: {
    	//	"Access-Control-Allow-Origin": "*",
    	//	"Access-Control-Allow-Credentials": "true",
//    "Access-Control-Allow-Headers": "Content-Type, echo_service, Authorization, x-id, Content-Length, X-Requested-With",
  //  		"Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS"
          }
},
    output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'dist'),
      library: 'main',
      libraryTarget: 'window',
      libraryExport: 'default'
    },
  };
};
