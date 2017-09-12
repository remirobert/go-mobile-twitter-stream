//
//  ASDisplayNodeSnapshots.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import FBSnapshotTestCase
import AsyncDisplayKit

extension CGSize {
    static var infinity: CGSize {
        return CGSize(width: Double.infinity, height: Double.infinity)
    }
}

extension ASDisplayNode {
    func testNode(sizeRange: CGSize = CGSize.infinity) -> ASDisplayNode {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        node.addSubnode(self)
        node.backgroundColor = UIColor.black
        node.layoutSpecBlock = { node, constrainedSize in
            let edgeInsetLaout = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            return ASInsetLayoutSpec(insets: edgeInsetLaout, child: self)
        }
        let sizeRange = ASSizeRangeMake(CGSize.zero, sizeRange)
        let fitsSize = node.layoutThatFits(sizeRange).size
        node.bounds = CGRect(origin: CGPoint.zero, size: fitsSize)

        ASDisplayNodePerformBlockOnEveryNode(nil, node, true) { node in
            node.layer.setNeedsDisplay()
        }
        node.recursivelyEnsureDisplaySynchronously(true)
        return node
    }
}
