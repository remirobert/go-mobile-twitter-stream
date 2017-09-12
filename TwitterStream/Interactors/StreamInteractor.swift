//
//  StreamPresenter.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

protocol StreamInteractorDelegate: class {
    func didRead(tweet: Tweet)
}

protocol StreamInteractor: class {
    weak var delegate: StreamInteractorDelegate? { get set }
    func start()
}
