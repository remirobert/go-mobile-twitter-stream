//
//  StreamViewControllerSnapshotTests.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import XCTest
import AsyncDisplayKit
import FBSnapshotTestCase

@testable import TwitterStream

class StreamViewControllerSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testStreamViewController() {
        let user1 = User(name: "TELLER", username: "POOL", imageUrl: "")
        let user2 = User(name: "chips", username: "username", imageUrl: "")

        let tweets = [
            Tweet(text: "まだマネタイズについても広告モデルや課金", user: user1),
            Tweet(text: "7月にリリースされたチャットフィクションアプリ。ユーザーはあらかじめ運営サイドが投稿されているストーリーを読んだり、自身でストーリーを作成して投稿したりできる（投稿作品の閲覧機能は今後提供）。ユーザーの年齢層は13〜18歳のティーンが50.3％、19〜22歳が20％以上と非常に若いサービスになっている。", user: user2)
        ]

        let interactor = MockStreamInterator(tweets: tweets)
        let streamViewController = StreamViewController(streamInterator: interactor)
        _ = streamViewController.view
        streamViewController.node.reloadData()
        streamViewController.node.recursivelyEnsureDisplaySynchronously(true)
        FBSnapshotVerifyView(streamViewController.view)
    }
}

class MockStreamInterator: StreamInteractor {
    private let tweets: [Tweet]
    weak var delegate: StreamInteractorDelegate?

    init(tweets: [Tweet]) {
        self.tweets = tweets
    }

    func start() {
        for tweet in tweets {
            delegate?.didRead(tweet: tweet)
        }
    }
}
