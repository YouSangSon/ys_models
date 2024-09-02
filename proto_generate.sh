#!/bin/sh

# Set the input proto file
PROTO_FILE=protos/users.proto

# Generate Python code
protoc -I=protos --python_out=./python ${PROTO_FILE}

# Generate Java code
#protoc -I=protos --java_out=./java protos/users.proto

# Generate Kotlin code (using Java code generation)
protoc -I=protos --java_out=./java --kotlin_out=./kotlin ${PROTO_FILE}

# Generate Go code with go_package option
protoc -I=protos --go_out=./golang --go_opt=paths=source_relative --go-grpc_out=./golang --go-grpc_opt=paths=source_relative ${PROTO_FILE}

# Generate JavaScript code
protoc -I=protos --js_out=import_style=commonjs,binary:./javascript ${PROTO_FILE}

echo "Code generation completed for Python, Java, Kotlin, Golang, and JavaScript."