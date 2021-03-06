// Code generated by protoc-gen-go.
// source: URPacketType.proto
// DO NOT EDIT!

/*
Package URWWPacketProtocol is a generated protocol buffer package.

It is generated from these files:
	URPacketType.proto
	URProtocol.proto

It has these top-level messages:
	PHeader
	Result
	URProtocol
	URLoginReq
	URLoginRes
	URLogoutReq
	URLogoutRes
*/
package URWWPacketProtocol

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion2 // please upgrade the proto package

type URPacketType int32

const (
	URPacketType_kUriInvalid    URPacketType = 0
	URPacketType_kUriPLoginReq  URPacketType = 10
	URPacketType_kUriPLoginRes  URPacketType = 11
	URPacketType_kUriPLogoutReq URPacketType = 12
	URPacketType_kUriPLogoutRes URPacketType = 13
)

var URPacketType_name = map[int32]string{
	0:  "kUriInvalid",
	10: "kUriPLoginReq",
	11: "kUriPLoginRes",
	12: "kUriPLogoutReq",
	13: "kUriPLogoutRes",
}
var URPacketType_value = map[string]int32{
	"kUriInvalid":    0,
	"kUriPLoginReq":  10,
	"kUriPLoginRes":  11,
	"kUriPLogoutReq": 12,
	"kUriPLogoutRes": 13,
}

func (x URPacketType) String() string {
	return proto.EnumName(URPacketType_name, int32(x))
}
func (URPacketType) EnumDescriptor() ([]byte, []int) { return fileDescriptor0, []int{0} }

type ResultType int32

const (
	ResultType_ResultTypeOK   ResultType = 0
	ResultType_ResultTypeFail ResultType = 1
)

var ResultType_name = map[int32]string{
	0: "ResultTypeOK",
	1: "ResultTypeFail",
}
var ResultType_value = map[string]int32{
	"ResultTypeOK":   0,
	"ResultTypeFail": 1,
}

func (x ResultType) String() string {
	return proto.EnumName(ResultType_name, int32(x))
}
func (ResultType) EnumDescriptor() ([]byte, []int) { return fileDescriptor0, []int{1} }

type PHeader struct {
	Uid      uint64  `protobuf:"varint,1,opt,name=uid" json:"uid,omitempty"`
	Seqid    uint64  `protobuf:"varint,2,opt,name=seqid" json:"seqid,omitempty"`
	Platform uint32  `protobuf:"varint,3,opt,name=platform" json:"platform,omitempty"`
	Version  uint32  `protobuf:"varint,4,opt,name=version" json:"version,omitempty"`
	Result   *Result `protobuf:"bytes,5,opt,name=result" json:"result,omitempty"`
}

func (m *PHeader) Reset()                    { *m = PHeader{} }
func (m *PHeader) String() string            { return proto.CompactTextString(m) }
func (*PHeader) ProtoMessage()               {}
func (*PHeader) Descriptor() ([]byte, []int) { return fileDescriptor0, []int{0} }

func (m *PHeader) GetUid() uint64 {
	if m != nil {
		return m.Uid
	}
	return 0
}

func (m *PHeader) GetSeqid() uint64 {
	if m != nil {
		return m.Seqid
	}
	return 0
}

func (m *PHeader) GetPlatform() uint32 {
	if m != nil {
		return m.Platform
	}
	return 0
}

func (m *PHeader) GetVersion() uint32 {
	if m != nil {
		return m.Version
	}
	return 0
}

func (m *PHeader) GetResult() *Result {
	if m != nil {
		return m.Result
	}
	return nil
}

type Result struct {
	Code   ResultType `protobuf:"varint,1,opt,name=code,enum=URWWPacketProtocol.ResultType" json:"code,omitempty"`
	ResMsg string     `protobuf:"bytes,2,opt,name=res_msg,json=resMsg" json:"res_msg,omitempty"`
}

func (m *Result) Reset()                    { *m = Result{} }
func (m *Result) String() string            { return proto.CompactTextString(m) }
func (*Result) ProtoMessage()               {}
func (*Result) Descriptor() ([]byte, []int) { return fileDescriptor0, []int{1} }

func (m *Result) GetCode() ResultType {
	if m != nil {
		return m.Code
	}
	return ResultType_ResultTypeOK
}

func (m *Result) GetResMsg() string {
	if m != nil {
		return m.ResMsg
	}
	return ""
}

func init() {
	proto.RegisterType((*PHeader)(nil), "URWWPacketProtocol.PHeader")
	proto.RegisterType((*Result)(nil), "URWWPacketProtocol.Result")
	proto.RegisterEnum("URWWPacketProtocol.URPacketType", URPacketType_name, URPacketType_value)
	proto.RegisterEnum("URWWPacketProtocol.ResultType", ResultType_name, ResultType_value)
}

func init() { proto.RegisterFile("URPacketType.proto", fileDescriptor0) }

var fileDescriptor0 = []byte{
	// 289 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x09, 0x6e, 0x88, 0x02, 0xff, 0x74, 0x91, 0xdd, 0x4a, 0xc3, 0x30,
	0x18, 0x86, 0x17, 0xf7, 0xa7, 0xdf, 0x7e, 0x8c, 0x1f, 0x82, 0x61, 0x07, 0x32, 0x76, 0x54, 0x76,
	0xd0, 0x83, 0x7a, 0x0f, 0xa2, 0xa8, 0x58, 0x82, 0x65, 0x87, 0x52, 0xdb, 0x58, 0xc2, 0xda, 0xa6,
	0x4b, 0xda, 0x81, 0xd7, 0xe2, 0xcd, 0x4a, 0x52, 0x67, 0xc5, 0xe1, 0x59, 0xde, 0x27, 0xef, 0x17,
	0x9e, 0x24, 0x80, 0x11, 0x0f, 0xe3, 0x64, 0x2b, 0xea, 0x97, 0x8f, 0x4a, 0xf8, 0x95, 0x56, 0xb5,
	0x42, 0x8c, 0xf8, 0x66, 0xd3, 0xd2, 0xd0, 0x82, 0x44, 0xe5, 0xab, 0x4f, 0x02, 0xe3, 0xf0, 0x4e,
	0xc4, 0xa9, 0xd0, 0x48, 0xa1, 0xdf, 0xc8, 0x94, 0x91, 0x25, 0xf1, 0x06, 0xdc, 0x2e, 0xf1, 0x12,
	0x86, 0x46, 0xec, 0x64, 0xca, 0x4e, 0x1c, 0x6b, 0x03, 0x2e, 0xe0, 0xb4, 0xca, 0xe3, 0xfa, 0x5d,
	0xe9, 0x82, 0xf5, 0x97, 0xc4, 0x9b, 0xf1, 0x9f, 0x8c, 0x0c, 0xc6, 0x7b, 0xa1, 0x8d, 0x54, 0x25,
	0x1b, 0xb8, 0xad, 0x43, 0xc4, 0x00, 0x46, 0x5a, 0x98, 0x26, 0xaf, 0xd9, 0x70, 0x49, 0xbc, 0x49,
	0xb0, 0xf0, 0x8f, 0x75, 0x7c, 0xee, 0x1a, 0xfc, 0xbb, 0xb9, 0x8a, 0x60, 0xd4, 0x12, 0x0c, 0x60,
	0x90, 0xa8, 0x54, 0x38, 0xb9, 0x79, 0x70, 0xfd, 0xff, 0xac, 0xbd, 0x2f, 0x77, 0x5d, 0xbc, 0x82,
	0xb1, 0x16, 0xe6, 0xb5, 0x30, 0x99, 0xf3, 0x3f, 0x73, 0xc7, 0x3e, 0x99, 0x6c, 0x5d, 0xc0, 0xf4,
	0xf7, 0xf3, 0xe0, 0x39, 0x4c, 0xb6, 0x91, 0x96, 0xf7, 0xe5, 0x3e, 0xce, 0x65, 0x4a, 0x7b, 0x78,
	0x01, 0x33, 0x0b, 0xc2, 0x47, 0x95, 0xc9, 0x92, 0x8b, 0x1d, 0x85, 0xbf, 0xc8, 0xd0, 0x09, 0x22,
	0xcc, 0x0f, 0x48, 0x35, 0xb5, 0xad, 0x4d, 0x8f, 0x98, 0xa1, 0xb3, 0x75, 0x00, 0xd0, 0xb9, 0x21,
	0x85, 0x69, 0x97, 0x9e, 0x1f, 0x68, 0xcf, 0xce, 0x74, 0xe4, 0x36, 0x96, 0x39, 0x25, 0x6f, 0x23,
	0xf7, 0x65, 0x37, 0x5f, 0x01, 0x00, 0x00, 0xff, 0xff, 0xf2, 0x1d, 0x00, 0xa5, 0xc8, 0x01, 0x00,
	0x00,
}
