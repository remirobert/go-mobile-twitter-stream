//
//  TwitterReponse+Tweet.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Twitter

extension TwitterTweet {
    func toTweet() -> Tweet {
        let user = User(name: userName(),
                        username: userDisplayedName(),
                        imageUrl: userImageUrl())
        return Tweet(text: text(), user: user)
    }
}
