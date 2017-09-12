//
//  StreamViewFactory.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

class StreamViewControllerFactory: StreamViewFactory {
    func make() -> StreamView {
        return StreamViewController()
    }
}
