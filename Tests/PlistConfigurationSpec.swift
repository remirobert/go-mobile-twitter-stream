//
//  PlistConfigurationSpec.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Quick
import Nimble

@testable import TwitterStream

class PlistConfigurationSpec: QuickSpec {
    override func spec() {
        super.spec()

        describe("PlistConfigurationSpec tests") {
            context("initialization with config") {
                it("should be initialized with the right values") {
                    let config = [
                        "consumer":"c1",
                        "consumer-secret":"c2",
                        "token":"t1",
                        "token-secret":"t2",
                        "track":"ios"
                    ]
                    let plistConfiguration = PlistConfiguration(config: config)
                    expect(plistConfiguration.consumer) == "c1"
                    expect(plistConfiguration.consumerSecret) == "c2"
                    expect(plistConfiguration.token) == "t1"
                    expect(plistConfiguration.tokenSecret) == "t2"
                    expect(plistConfiguration.track) == "ios"
                }
            }
        }
    }
}
