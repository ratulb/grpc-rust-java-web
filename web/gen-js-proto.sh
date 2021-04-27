protoc ./proto/echo.proto --js_out=import_style=commonjs,binary:./ --grpc-web_out=import_style=commonjs,mode=grpcwebtext:.
mv proto/*.js .
