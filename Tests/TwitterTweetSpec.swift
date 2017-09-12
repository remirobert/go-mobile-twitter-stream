//
//  TwitterInteractorSpec.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Quick
import Nimble
import Twitter

@testable import TwitterStream

class TwitterTweetSpec: QuickSpec {
    override func spec() {
        super.spec()

        describe("TwitterTweetSpec tests") {
            context("convert to Tweet") {
                it("with the same datas") {
                    let fakeTwitterTweet = FakeTwitterTweet()
                    let tweet = fakeTwitterTweet.toTweet()
                    expect(tweet.text) == fakeTwitterTweet.text()
                    expect(tweet.user.name) == fakeTwitterTweet.userName()
                    expect(tweet.user.username) == fakeTwitterTweet.userDisplayedName()
                    expect(tweet.user.imageUrl) == fakeTwitterTweet.userImageUrl()
                }
            }
        }
    }
}

class FakeTwitterTweet: TwitterTweet {
    override func text() -> String! {
        return "content"
    }

    override func userName() -> String! {
        return "user"
    }

    override func userDisplayedName() -> String! {
        return "username"
    }

    override func userImageUrl() -> String! {
        return "image"
    }
}
