#!/bin/sh

# Set the input proto file
PROTO_FILE=protos/users.proto

# Generate Python code
protoc -I=protos --python_out=./python ${PROTO_FILE}

# Generate Java code
#protoc -I=protos --java_out=./java protos/users.proto

# Generate Kotlin code (using Java code generation)
protoc -I=protos --java_out=./java --kotlin_out=./kotlin ${PROTO_FILE}
# protoc -I=protos --java_out=./java --grpc-java_out=./java ${PROTO_FILE}

# Generate Go code with go_package option
protoc -I=protos --go_out=./golang --go_opt=paths=source_relative --go-grpc_out=./golang --go-grpc_opt=paths=source_relative ${PROTO_FILE}

echo "Code generation completed for Python, Java, Kotlin, Golang."
