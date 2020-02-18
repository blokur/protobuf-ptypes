# Protobuf ptypes

Simple example of a basic protobuf repository made for a Medium article.
The goal is to showcase usage of well-known types in the same way [Google does](https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/empty.proto).

The Makefile has a single target called `protobufs` which generates go code
using shares types.

Transpiled go source files are stored in the `_build` folder. Notice how both
`kennel/index.pb.go` and `notifier/index.pb.go` reference `ptypes/index.pb.go`
and how the package they import reflects the path defined with `go_package`.
