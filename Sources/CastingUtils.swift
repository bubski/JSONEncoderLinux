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

import Foundation

/**
There are discrepancies in how standard casting behaves for numeric types on Apple OSes and Linux.
E.g. casting an `Int8` to `NSNumber` will succeed on macOS, but will not on Linux.

This function is intended to provide a consistent behaviour for all platforms (maintain the one from Apple OSes).

## Usage:
Normally you would cast an object using:
```
if let casted = object as? NewType {
  …
}
```
with this function, you would instead write:
```
if let casted: NewType = platformConsistentCast(object) {
…
}
```

- Note:
Below is a chart depicting which casting works on:
* A - Apple OSes
* L - Linux

```
y-axis: Type casting from
x-axis: Type casting to
```

```
.--------.----.-----.-----.------.-----.------.-----.------.-----.------.----.---.----.-------.--------.
|        |Int8|UInt8|Int16|UInt16|Int32|UInt32|Int64|UInt64|Float|Double|Bool|Int|UInt|Decimal|NSNumber|
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int8    |AL  |     |     |      |     |      |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt8   |    |AL   |     |      |     |      |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int16   |    |     |AL   |      |     |      |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt16  |    |     |     |AL    |     |      |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int32   |    |     |     |      |AL   |      |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt32  |    |     |     |      |     |AL    |     |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int64   |    |     |     |      |     |      |AL   |      |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt64  |    |     |     |      |     |      |     |AL    |     |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Float   |    |     |     |      |     |      |     |      |AL   |      |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Double  |    |     |     |      |     |      |     |      |     |AL    |    |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Bool    |    |     |     |      |     |      |     |      |     |      |AL  |   |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int     |    |     |     |      |     |      |     |      |     |      |    |AL |    |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt    |    |     |     |      |     |      |     |      |     |      |    |   |AL  |       |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Decimal |    |     |     |      |     |      |     |      |     |      |    |   |    |AL     |A       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|NSNumber|A   |A    |A    |A     |A    |A     |A    |A     |A    |A     |A   |A  |A   |       |AL      |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
```

- Returns: Casted representation of passed object, or `nil` if casting failed.

- Parameter object: Object to cast.
*/
func platformConsistentCast<T>(_ object: Any) -> T? {
	if let casted = object as? T {
		return casted
	}

	#if os(Linux)

		if T.self is NSNumber.Type {
			return platformConsistentCastToNSNumber(object) as? T
		}

		if let nsnumber = object as? NSNumber {
			switch T.self {
			case is Int8.Type: return nsnumber.int8Value as? T
			case is UInt8.Type: return nsnumber.uint8Value as? T
			case is Int16.Type: return nsnumber.int16Value as? T
			case is UInt16.Type: return nsnumber.uint16Value as? T
			case is Int32.Type: return nsnumber.int32Value as? T
			case is UInt32.Type: return nsnumber.uint32Value as? T
			case is Int64.Type: return nsnumber.int64Value as? T
			case is UInt64.Type: return nsnumber.uint64Value as? T
			case is Float.Type: return nsnumber.floatValue as? T
			case is Double.Type: return nsnumber.doubleValue as? T
			case is Bool.Type: return nsnumber.boolValue as? T
			case is Int.Type: return nsnumber.intValue as? T
			case is UInt.Type: return nsnumber.uintValue as? T
			case is Decimal.Type: return nil
			default: break
			}
		}

        if T.self is NSString.Type {
            if let casted = object as? String { return casted._nsObject as? T }
        }

        if T.self is String.Type {
            if let casted = object as? NSString { return casted._swiftObject as? T }
        }
	#endif

	return nil
}

private func platformConsistentCastToNSNumber(_ object: Any) -> NSNumber? {
	if let casted = object as? NSNumber {
		return casted
	}

	if let casted = object as? Int8 {
		return NSNumber(value: casted)
	}

	if let casted = object as? UInt8 {
		return NSNumber(value: casted)
	}

	if let casted = object as? Int16 {
		return NSNumber(value: casted)
	}

	if let casted = object as? UInt16 {
		return NSNumber(value: casted)
	}

	if let casted = object as? Int32 {
		return NSNumber(value: casted)
	}

	if let casted = object as? UInt32 {
		return NSNumber(value: casted)
	}

	if let casted = object as? Int64 {
		return NSNumber(value: casted)
	}

	if let casted = object as? UInt64 {
		return NSNumber(value: casted)
	}

	if let casted = object as? Float {
		return NSNumber(value: casted)
	}

	if let casted = object as? Double {
		return NSNumber(value: casted)
	}

	if let casted = object as? Bool {
		return NSNumber(value: casted)
	}

	if let casted = object as? Int {
		return NSNumber(value: casted)
	}

	if let casted = object as? UInt {
		return NSNumber(value: casted)
	}

	if let casted = object as? Decimal {
		return NSDecimalNumber(decimal: casted)
	}
	
	return nil
}

extension CodingKey {
    var nsstringValue: NSString {
        return NSString(string: self.stringValue)
    }
}

#endif
