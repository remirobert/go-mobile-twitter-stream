//
//  TweetCellNodeSnapshotTests.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import XCTest
import AsyncDisplayKit
import FBSnapshotTestCase

@testable import TwitterStream

class TweetCellNodeSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testCell() {
        let user = User(name: "name", username: "username", imageUrl: "")
        let tweet = Tweet(text: "「若い人が活字離れしているという話は良くあるが、実際は活字を読むフォーマットが変わってきたのではないか。海外でHookedなどが出てきてそう考えるようになった。『恋空』（2000年代にヒットしたケータイ小説）のようなヒット作もこのフォーマットで出していきたい」——ピックアップ代表取締役社長の宮本拓氏はTELLERをリリースした背景についてこう語る。", user: user)

        let cellNode = TweetCellNode(tweet: tweet)
        let testNode = cellNode.testNode(sizeRange: CGSize(width: 320, height: Double.infinity))
        FBSnapshotVerifyView(testNode.view)
    }
}
