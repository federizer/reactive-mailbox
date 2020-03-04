GOOGLEAPIS_DIR=./third_party/googleapis

#install-dependencies:
#	go get github.com/gogo/protobuf/protoc-gen-gofast

build-proto:
	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated/system \
			system.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated/auth \
			auth.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated/auth \
			auth_session.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--dart_out=grpc:backend/dart/lib/api/generated \
			$(GOOGLEAPIS_DIR)/google/protobuf/empty.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated/system \
			system.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated/auth \
			auth.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated/auth \
			auth_session.proto

	protoc -I$(GOOGLEAPIS_DIR) \
			-I/usr/local/include \
			-I api/proto/v1 \
			--go_out=plugins=grpc:backend/go/api/generated/google \
			$(GOOGLEAPIS_DIR)/google/protobuf/empty.proto

clean:
	rm -r backend/dart/lib/api/generated/system/*
	rm -r backend/dart/lib/api/generated/auth/*
	rm -r backend/dart/lib/api/generated/google/*
	rm -r backend/go/api/generated/system/*
	rm -r backend/go/api/generated/auth/*
	rm -r backend/go/api/generated/google/*
