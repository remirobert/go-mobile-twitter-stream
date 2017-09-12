//
//  TwitterConfiguration.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol TwitterConfiguration {
    var consumer: String { get }
    var consumerSecret: String { get }
    var token: String { get }
    var tokenSecret: String { get }
    var track: String { get }
}

class PlistConfiguration: TwitterConfiguration {
    let consumer: String
    let consumerSecret: String
    let token: String
    let tokenSecret: String
    let track: String

    init(config: [String:Any] = Bundle.main.defaultConfig) {
        consumer = config.value(keyPath: "consumer")
        consumerSecret = config.value(keyPath: "consumer-secret")
        token = config.value(keyPath: "token")
        tokenSecret = config.value(keyPath: "token-secret")
        track = config.value(keyPath: "track")
    }
}

private extension Dictionary where Key == String {
    func value(keyPath: String) -> String {
        guard let value = self[keyPath] as? String else {
            fatalError("\(keyPath) not found")
        }
        return value
    }
}

private extension Bundle {
    var defaultConfig: [String:Any] {
        guard let configPath = self.path(forResource: "twitter-config", ofType: "plist"),
            let config = NSDictionary(contentsOfFile: configPath) as? [String : Any] else {
                fatalError("twitter-config.plist not found in bundle : \(self)")
        }
        return config
    }
}
