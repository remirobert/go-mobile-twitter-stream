//
//  Viewable+UIKit.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

extension View {
    var viewController: UIViewController? {
        return self as? UIViewController
    }
}

extension View {
    func present(view: View) {
        guard let presentController = view.viewController else { return }
        viewController?.present(presentController, animated: true, completion: nil)
    }

    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
