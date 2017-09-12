//
//  Viewable.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

protocol View: class {
    func present(view: View)
    func dismiss()
}
