//
//  TweetCellNode.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import AsyncDisplayKit

class TweetCellNode: ASCellNode {
    fileprivate let headerNode: HeaderCellNode
    fileprivate let textNode: ASTextNode

    init(tweet: Tweet) {
        headerNode = HeaderCellNode(user: tweet.user)
        textNode = ASTextNode()
        super.init()

        setupViews()
        setupHierarchy()
        setupViewData(tweet: tweet)
    }

    private func setupViewData(tweet: Tweet) {
        textNode.attributedText = NSAttributedString(string: tweet.text)
    }
}

extension TweetCellNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layoutStack = ASStackLayoutSpec.vertical()
        layoutStack.children = [headerNode, textNode]
        let insets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        return ASInsetLayoutSpec(insets: insets, child: layoutStack)
    }
}

extension TweetCellNode {
    fileprivate func setupViews() {
        backgroundColor = UIColor.white
        textNode.maximumNumberOfLines = 0
    }

    fileprivate func setupHierarchy() {
        addSubnode(headerNode)
        addSubnode(textNode)
    }
}
