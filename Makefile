define COMPILE_CMD
# Build the ptypes, this is a shared proto and defines its path and import path differently
# Note the usage of `source_relative` to ensure integrity with the `go_package` option used above:
protoc -I ptypes --go_out=pluginsgrpc,paths=source_relative:_build/go/ptypes index.proto ;
# Build go files for each dependency
for filename in ./kennel/*.proto; do \
	protoc -I kennel -I . --go_out=plugins=grpc:_build/go/kennel "$(basename "$${filename}")" ; \
done; \
for filename in ./notifier/*.proto; do \
	protoc -I notifier -I . --go_out=plugins=grpc:_build/go/notifier "$(basename "$${filename}")" ; \
done;
endef

.PHONY: protobuf
protobuf:
	@$(COMPILE_CMD)

