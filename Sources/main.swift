import Foundation

struct Bar: Codable {
    var int8: Int8 = 1
    var int16: Int16 = 2
    var int32: Int32 = 3
    var int64: Int64 = 4
    var int: Int = 5

    var uint8: UInt8 = 6
    var uint16: UInt16 = 7
    var uint32: UInt32 = 8
    var uint64: UInt64 = 9
    var uint: UInt = 10

    var array_of_int8: [Int8] = [11, 12]
    var array_of_int16: [Int16] = [13, 14]
    var array_of_int32: [Int32] = [15, 16]
    var array_of_int64: [Int64] = [17, 18]
    var array_of_int: [Int] = [19, 20]

    var array_of_uint8: [UInt8] = [21, 22]
    var array_of_uint16: [UInt16] = [23, 24]
    var array_of_uint32: [UInt32] = [25, 26]
    var array_of_uint64: [UInt64] = [27 ,28]
    var array_of_uint: [UInt] = [29, 30]

    var dictionary_of_int8: [String: Int8] = ["Key1": 1, "Key2": 2]
    var dictionary_of_int16: [String: Int16] = ["Key1": 3, "Key2": 4]
    var dictionary_of_int32: [String: Int32] = ["Key1": 5, "Key2": 6]
    var dictionary_of_int64: [String: Int64] = ["Key1": 7, "Key2": 8]
    var dictionary_of_int: [String: Int] = ["Key1": 9, "Key2": 10]

    var dictionary_of_uint8: [String: UInt8] = ["Key1": 11, "Key2": 12]
    var dictionary_of_uint16: [String: UInt16] = ["Key1": 13, "Key2": 14]
    var dictionary_of_uint32: [String: UInt32] = ["Key1": 15, "Key2": 16]
    var dictionary_of_uint64: [String: UInt64] = ["Key1": 17, "Key2": 18]
    var dictionary_of_uint: [String: UInt] = ["Key1": 19, "Key2": 20]

    var string: String = "StringValue"
    var array_of_string: [String] = ["StringValue1", "StringValue2"]
    var dictionary_of_string: [String: String] = ["Key1": "Value1", "Key2": "Value2"]
}

struct Foo: Codable {
    var int8: Int8 = 1
    var int16: Int16 = 2
    var int32: Int32 = 3
    var int64: Int64 = 4
    var int: Int = 5

    var uint8: UInt8 = 6
    var uint16: UInt16 = 7
    var uint32: UInt32 = 8
    var uint64: UInt64 = 9
    var uint: UInt = 10

    var array_of_int8: [Int8] = [11, 12]
    var array_of_int16: [Int16] = [13, 14]
    var array_of_int32: [Int32] = [15, 16]
    var array_of_int64: [Int64] = [17, 18]
    var array_of_int: [Int] = [19, 20]

    var array_of_uint8: [UInt8] = [21, 22]
    var array_of_uint16: [UInt16] = [23, 24]
    var array_of_uint32: [UInt32] = [25, 26]
    var array_of_uint64: [UInt64] = [27 ,28]
    var array_of_uint: [UInt] = [29, 30]

    var dictionary_of_int8: [String: Int8] = ["Key1": 1, "Key2": 2]
    var dictionary_of_int16: [String: Int16] = ["Key1": 3, "Key2": 4]
    var dictionary_of_int32: [String: Int32] = ["Key1": 5, "Key2": 6]
    var dictionary_of_int64: [String: Int64] = ["Key1": 7, "Key2": 8]
    var dictionary_of_int: [String: Int] = ["Key1": 9, "Key2": 10]

    var dictionary_of_uint8: [String: UInt8] = ["Key1": 11, "Key2": 12]
    var dictionary_of_uint16: [String: UInt16] = ["Key1": 13, "Key2": 14]
    var dictionary_of_uint32: [String: UInt32] = ["Key1": 15, "Key2": 16]
    var dictionary_of_uint64: [String: UInt64] = ["Key1": 17, "Key2": 18]
    var dictionary_of_uint: [String: UInt] = ["Key1": 19, "Key2": 20]

    var string: String = "StringValue"
    var array_of_string: [String] = ["StringValue1", "StringValue2"]
    var dictionary_of_string: [String: String] = ["Key1": "Value1", "Key2": "Value2"]

    var nested: Bar = Bar()
    var array_of_nested: [Bar] = [Bar(), Bar()]
    var dictionary_of_nested: [String: Bar] = ["Key1": Bar(), "Key2": Bar()]

    // does not conform to Codable
//    var url: URL = URL(string: "http://swift.org")!
//    var array_of_url: [URL] = [URL(string: "http://swift.org")!, URL(string: "http://apple.com")!]
//    var dictionary_of_url: [String: URL] = ["Key1": URL(string: "http://swift.org")!, "Key2": URL(string: "http://apple.com")!]
}

let foo = Foo()

do {
    let data = try! JSONEncoder().encode(foo)
    let obj = try! JSONDecoder().decode(Foo.self, from: data)

    print(obj)
}

do {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    let data = try! encoder.encode(foo)
    print(String(data: data, encoding: .utf8)!)
}

