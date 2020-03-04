GOOGLEAPIS_DIR=./third_party/googleapis

#install-dependencies:
#	go get github.com/gogo/protobuf/protoc-gen-gofast

build-proto:
    # dart
	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated \
			auth.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated \
			auth_session.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated \
			$(GOOGLEAPIS_DIR)/google/protobuf/empty.proto
	# go
	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated \
			auth.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated \
			auth_session.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated \
			$(GOOGLEAPIS_DIR)/google/protobuf/empty.proto


clean:
	rm -r backend/dart/lib/api/generated/*
	rm -r backend/go/api/generated/*