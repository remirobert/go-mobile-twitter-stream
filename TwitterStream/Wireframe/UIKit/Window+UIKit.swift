//
//  Window+UIKit.swift
//  TwitterStream
//
//  Created by Remi Robert on 11/08/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

extension UIWindow: Window {
    var rootView: View? {
        get {
            return rootViewController as? View
        }
        set {
            rootViewController = newValue?.viewController
        }
    }
}
