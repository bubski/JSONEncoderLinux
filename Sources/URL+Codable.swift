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
    
    extension URL : Codable {
        private enum CodingKeys : Int, CodingKey {
            case base
            case relative
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let relative = try container.decode(String.self, forKey: .relative)
            let base = try container.decodeIfPresent(URL.self, forKey: .base)

            guard let url = URL(string: relative, relativeTo: base) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                        debugDescription: "Invalid URL string."))
            }

            self = url
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.relativeString, forKey: .relative)
            if let base = self.baseURL {
                try container.encode(base, forKey: .base)
            }
        }
    }
    
#endif
