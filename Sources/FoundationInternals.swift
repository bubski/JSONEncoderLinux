//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

#if os(Linux)

    import Foundation
    import CoreFoundation

    protocol CustomNSError : Error {
        /// The domain of the error.
        static var errorDomain: String { get }

        /// The error code within the given domain.
        var errorCode: Int { get }

        /// The user-info dictionary.
        var errorUserInfo: [String : Any] { get }
    }

    extension CocoaError.Code {
        public static var coderReadCorrupt:                         CocoaError.Code { return CocoaError.Code(rawValue: 4864) }
        public static var coderValueNotFound:                       CocoaError.Code { return CocoaError.Code(rawValue: 4865) }
        public static var coderInvalidValue:                        CocoaError.Code { return CocoaError.Code(rawValue: 4866) }
    }

    extension CocoaError {
        public static var coderInvalidValue:                        CocoaError.Code { return CocoaError.Code.coderInvalidValue }
    }

    extension NSDate {
        typealias SwiftType = Date
        var _swiftObject: Date {
            return Date(timeIntervalSinceReferenceDate: timeIntervalSinceReferenceDate)
        }
    }

    extension CFDate {
        typealias NSType = NSDate
        typealias SwiftType = Date

        internal var _nsObject: NSType { return unsafeBitCast(self, to: NSType.self) }
        internal var _swiftObject: Date { return _nsObject._swiftObject }
    }

    extension String {
        typealias NSType = NSString
        typealias CFType = CFString
        internal var _nsObject: NSType { return _bridgeToObjectiveC() }
        internal var _cfObject: CFType { return _nsObject._cfObject }
    }

    extension NSString {
        typealias SwiftType = String
        internal var _cfObject: CFString { return unsafeBitCast(self, to: CFString.self) }
        internal var _swiftObject: String { return String._unconditionallyBridgeFromObjectiveC(self) }
    }

    extension CFString {
        typealias NSType = NSString
        typealias SwiftType = String
        internal var _nsObject: NSType { return unsafeBitCast(self, to: NSString.self) }
        internal var _swiftObject: String { return _nsObject._swiftObject }
    }

    extension TimeZone {
        var _nsObject : NSTimeZone { return _bridgeToObjectiveC() }
        var _cfObject : CFTimeZone { return _nsObject._cfObject }
    }

    extension NSTimeZone {
        typealias CFType = CFTimeZone
        var _cfObject: CFType {
            return unsafeBitCast(self, to: CFType.self)
        }
    }

    extension String {
        // this is only valid for the usage for CF since it expects the length to be in unicode characters instead of grapheme clusters "✌🏾".utf16.count = 3 and CFStringGetLength(CFSTR("✌🏾")) = 3 not 1 as it would be represented with grapheme clusters
        internal var length: Int {
            return utf16.count
        }
    }

    extension Date {
        typealias NSType = NSDate
        typealias CFType = CFDate

        internal var _nsObject: NSType { return NSDate(timeIntervalSinceReferenceDate: timeIntervalSinceReferenceDate) }
        internal var _cfObject: CFType { return _nsObject._cfObject }
    }

    extension NSDate {
        typealias CFType = CFDate
        internal var _cfObject: CFType {
            return unsafeBitCast(self, to: CFType.self)
        }
    }

#endif
