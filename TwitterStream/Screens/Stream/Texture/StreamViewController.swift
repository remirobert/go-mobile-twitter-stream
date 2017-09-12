//
//  StreamViewController.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import AsyncDisplayKit

class StreamViewController: ASViewController<ASTableNode>, StreamView {
    fileprivate let tableNode: ASTableNode
    fileprivate var tweets = [Tweet]()
    let streamInterator: StreamInteractor

    init(streamInterator: StreamInteractor = TwitterStreamInteractor()) {
        self.streamInterator = streamInterator
        tableNode = ASTableNode(style: .plain)
        super.init(node: tableNode)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        streamInterator.delegate = self
        view.backgroundColor = UIColor.gray
        streamInterator.start()
    }

    private func setupViews() {
        tableNode.view.allowsSelection = false
        tableNode.view.separatorStyle = .none
        tableNode.leadingScreensForBatching = 3.0
        tableNode.dataSource = self
    }
}

extension StreamViewController: StreamInteractorDelegate {
    func didRead(tweet: Tweet) {
        tweets.insert(tweet, at: 0)
        tableNode.performBatchUpdates({ 
            tableNode.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }, completion: nil)
    }
}

extension StreamViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> AsyncDisplayKit.ASCellNodeBlock {
        let tweet = tweets[indexPath.row]
        return { () -> ASCellNode in
            var cellNode: TweetCellNode!
            cellNode = TweetCellNode(tweet: tweet)
            return cellNode
        }
    }
}
