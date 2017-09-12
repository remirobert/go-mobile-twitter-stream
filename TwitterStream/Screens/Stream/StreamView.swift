//
//  StreamView.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

protocol StreamViewFactory: class {
    func make() -> StreamView
}

protocol StreamView: View {
    var streamInterator: StreamInteractor { get }
}
