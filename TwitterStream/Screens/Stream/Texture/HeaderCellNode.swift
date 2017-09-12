//
//  HeaderCellNode.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import AsyncDisplayKit

class HeaderCellNode: ASCellNode {
    fileprivate let imageNode: ASNetworkImageNode
    fileprivate let nameNode: ASTextNode
    fileprivate let usernameNode: ASTextNode

    init(user: User) {
        imageNode = ASNetworkImageNode()
        nameNode = ASTextNode()
        usernameNode = ASTextNode()
        super.init()

        setupViews()
        setupHierarchy()
        setupViewData(user: user)
    }

    private func setupViewData(user: User) {
        nameNode.attributedText = NSAttributedString(string: user.name,
                                                     attributes: TextAttributes.name)
        usernameNode.attributedText = NSAttributedString(string: user.username,
                                                         attributes: TextAttributes.username)
        imageNode.url = URL(string: user.imageUrl)
    }
}

extension HeaderCellNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASStackLayoutSpec.horizontal()
        layout.justifyContent = .start
        layout.alignItems = .center
        layout.spacing = 5
        layout.children = [imageNode, nameNode, usernameNode]
        return layout
    }
}

extension HeaderCellNode {
    fileprivate func setupViews() {
        backgroundColor = UIColor.white
        imageNode.style.preferredSize = CGSize(width: 44, height: 44)
        imageNode.backgroundColor = UIColor.black
        imageNode.shouldRenderProgressImages = true
        imageNode.shouldCacheImage = true
        imageNode.contentMode = .scaleAspectFit
        nameNode.maximumNumberOfLines = 1
        usernameNode.maximumNumberOfLines = 1
        usernameNode.style.flexShrink = 1
    }

    fileprivate func setupHierarchy() {
        addSubnode(imageNode)
        addSubnode(nameNode)
        addSubnode(usernameNode)
    }
}
