//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Remi Robert on 12/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import XCTest
import AsyncDisplayKit
import FBSnapshotTestCase

@testable import TwitterStream

class HeaderCellNodeSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testHeaderCellNode() {
        let user = User(name: "name", username: "username", imageUrl: "")

        let cellNode = HeaderCellNode(user: user)
        FBSnapshotVerifyView(cellNode.testNode().view)
    }
}
