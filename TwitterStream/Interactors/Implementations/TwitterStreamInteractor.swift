//
//  TwitterStreamService.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Twitter

class TwitterStreamInteractor: NSObject, StreamInteractor {
    fileprivate let config: TwitterConfiguration
    fileprivate var client: TwitterTwitter!

    weak var delegate: StreamInteractorDelegate?

    init(config: TwitterConfiguration = PlistConfiguration()) {
        self.config = config
        let streamConfig = TwitterNewConfig(config.consumer,
                                            config.consumerSecret,
                                            config.token,
                                            config.tokenSecret)
        super.init()
        client = TwitterNewTitter(self, streamConfig)
    }
}

extension TwitterStreamInteractor {
    func start() {
        client.startRead(config.track)
    }
}

extension TwitterStreamInteractor: TwitterTwitterCallbackProtocol {
    func getContent(_ response: TwitterTweet!) {
        let tweet = response.toTweet()
        DispatchQueue.main.async {
            self.delegate?.didRead(tweet: tweet)
        }
    }
}
