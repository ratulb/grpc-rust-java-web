const path = require('path');

module.exports = (env) => {
  // Use env.<YOUR VARIABLE> here:
  //console.log('API_URL: ', env.API_URL); // 'local'

  return {
    entry: ['./client.js'],
    output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'dist'),
      library: 'main',
      libraryTarget: 'window',
      libraryExport: 'default'
    },
  };
};
