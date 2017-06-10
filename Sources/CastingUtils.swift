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
*  - Apple OSes
* L - Linux

```
y-axis: Type casting from
x-axis: Type casting to
```

```
.--------.----.-----.-----.------.-----.------.-----.------.-----.------.----.---.----.-------.--------.
|        |Int8|UInt8|Int16|UInt16|Int32|UInt32|Int64|UInt64|Float|Double|Bool|Int|UInt|Decimal|NSNumber|
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int8    |L  |     |     |      |     |      |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt8   |    |L   |     |      |     |      |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int16   |    |     |L   |      |     |      |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt16  |    |     |     |L    |     |      |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int32   |    |     |     |      |L   |      |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt32  |    |     |     |      |     |L    |     |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int64   |    |     |     |      |     |      |L   |      |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt64  |    |     |     |      |     |      |     |L    |     |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Float   |    |     |     |      |     |      |     |      |L   |      |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Double  |    |     |     |      |     |      |     |      |     |L    |    |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Bool    |    |     |     |      |     |      |     |      |     |      |L  |   |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Int     |    |     |     |      |     |      |     |      |     |      |    |L |    |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|UInt    |    |     |     |      |     |      |     |      |     |      |    |   |L  |       |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|Decimal |    |     |     |      |     |      |     |      |     |      |    |   |    |L     |       |
:--------+----+-----+-----+------+-----+------+-----+------+-----+------+----+---+----+-------+--------:
|NSNumber|   |    |    |     |    |     |    |     |    |     |   |  |   |       |L      |
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
