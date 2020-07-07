//
//  ImmutableWrappers.swift
//  
//
//  Created by Paul Fechner on 7/7/20.
//

import Foundation

//MARK: - Immutable Wrapper

/// Wraps the type to make it Immutable, (en/de)coding is transient and won't affect it's wrapped Type
@propertyWrapper
public struct Immutable<T> {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

// TransientCodable will handle the (en/de)coding here when needed

extension Immutable: Encodable, TransientEncodable where T: Encodable {}
extension Immutable: Decodable, TransientDecodable where T: Decodable {}
extension Immutable: TransientCodable where T: Codable {}

extension Immutable: Equatable where T: Equatable { }
