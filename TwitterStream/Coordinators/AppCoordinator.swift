//
//  AppCoordinator.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

class AppCoordinator {
    private let window: Window

    private let streamCoordinator: StreamCoordinator

    init(window: Window) {
        self.window = window
        streamCoordinator = StreamCoordinator(window: window)
    }

    func start() {
        streamCoordinator.start()
    }
}
