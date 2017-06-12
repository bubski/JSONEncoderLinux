// MIT License
//
// Copyright (c) 2017 Bartek Chlebek
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if os(Linux)

    import XCTest
    @testable import JSONEncoderLinux

    class CastingUtilsTests: XCTestCase {

        func testCastingInt8() {
            let value: Int8 = 1

            XCTAssertEqual(1 as Int8, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingUInt8() {
            let value: UInt8 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(1 as UInt8, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingInt16() {
            let value: Int16 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(1 as Int16, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingUInt16() {
            let value: UInt16 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(1 as UInt16, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingInt32() {
            let value: Int32 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(1 as Int32, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingUInt32() {
            let value: UInt32 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(1 as UInt32, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingInt64() {
            let value: Int64 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(1 as Int64, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingUInt64() {
            let value: UInt64 = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(1 as UInt64, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingFloat() {
            let value: Float = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(1 as Float, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingDouble() {
            let value: Double = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(1 as Double, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingBool() {
            let value: Bool = true

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(true as Bool, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingInt() {
            let value: Int = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(1 as Int, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingUInt() {
            let value: UInt = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(1 as UInt, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingDecimal() {
            let value: Decimal = 1

            XCTAssertEqual(nil, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Float?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Double?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Int?)
            XCTAssertEqual(nil, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(1 as Decimal, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(NSDecimalNumber(decimal: 1) as NSNumber, platformConsistentCast(value) as NSNumber?)
        }

        func testCastingNSNumber() {
            let value: NSNumber = 1

            XCTAssertEqual(1 as Int8, platformConsistentCast(value) as Int8?)
            XCTAssertEqual(1 as UInt8, platformConsistentCast(value) as UInt8?)
            XCTAssertEqual(1 as Int16, platformConsistentCast(value) as Int16?)
            XCTAssertEqual(1 as UInt16, platformConsistentCast(value) as UInt16?)
            XCTAssertEqual(1 as Int32, platformConsistentCast(value) as Int32?)
            XCTAssertEqual(1 as UInt32, platformConsistentCast(value) as UInt32?)
            XCTAssertEqual(1 as Int64, platformConsistentCast(value) as Int64?)
            XCTAssertEqual(1 as UInt64, platformConsistentCast(value) as UInt64?)
            XCTAssertEqual(1 as Float, platformConsistentCast(value) as Float?)
            XCTAssertEqual(1 as Double, platformConsistentCast(value) as Double?)
            XCTAssertEqual(true as Bool, platformConsistentCast(value) as Bool?)
            XCTAssertEqual(1 as Int, platformConsistentCast(value) as Int?)
            XCTAssertEqual(1 as UInt, platformConsistentCast(value) as UInt?)
            XCTAssertEqual(nil, platformConsistentCast(value) as Decimal?)
            XCTAssertEqual(1 as NSNumber, platformConsistentCast(value) as NSNumber?)
        }
    }

#if os(Linux)
    
    extension CastingUtilsTests {
        static var allTests = [
            ("testCastingInt8", testCastingInt8),
            ("testCastingUInt8", testCastingUInt8),
            ("testCastingInt16", testCastingInt16),
            ("testCastingUInt16", testCastingUInt16),
            ("testCastingInt32", testCastingInt32),
            ("testCastingUInt32", testCastingUInt32),
            ("testCastingInt64", testCastingInt64),
            ("testCastingUInt64", testCastingUInt64),
            ("testCastingFloat", testCastingFloat),
            ("testCastingDouble", testCastingDouble),
            ("testCastingBool", testCastingBool),
            ("testCastingInt", testCastingInt),
            ("testCastingUInt", testCastingUInt),
            ("testCastingDecimal", testCastingDecimal),
            ("testCastingNSNumber", testCastingNSNumber),
            ]
    }

#endif

#endif

