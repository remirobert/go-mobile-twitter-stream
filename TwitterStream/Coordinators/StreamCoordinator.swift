//
//  StreamCoordinator.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

class StreamCoordinator {
    private let viewFactory: StreamViewFactory
    private let window: Window

    init(viewFactory: StreamViewFactory = StreamViewControllerFactory(),
         window: Window) {
        self.viewFactory = viewFactory
        self.window = window
    }

    func start() {
        self.window.rootView = viewFactory.make()
    }
}
