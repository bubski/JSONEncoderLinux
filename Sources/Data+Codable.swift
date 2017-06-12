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
    
    extension Data : Codable {
        public init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()

            // It's more efficient to pre-allocate the buffer if we can.
            if let count = container.count {
                self.init(count: count)

                // Loop only until count, not while !container.isAtEnd, in case count is underestimated (this is misbehavior) and we haven't allocated enough space.
                // We don't want to write past the end of what we allocated.
                for i in 0 ..< count {
                    let byte = try container.decode(UInt8.self)
                    self[i] = byte
                }
            } else {
                self.init()
            }

            while !container.isAtEnd {
                var byte = try container.decode(UInt8.self)
                self.append(&byte, count: 1)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.unkeyedContainer()

            // Since enumerateBytes does not rethrow, we need to catch the error, stow it away, and rethrow if we stopped.
            var caughtError: Error? = nil
            self.enumerateBytes { (buffer: UnsafeBufferPointer<UInt8>, byteIndex: Data.Index, stop: inout Bool) in
                do {
                    try container.encode(contentsOf: buffer)
                } catch {
                    caughtError = error
                    stop = true
                }
            }

            if let error = caughtError {
                throw error
            }
        }
    }
    
#endif
