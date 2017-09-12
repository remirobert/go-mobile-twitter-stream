//
//  TextAttributes.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

struct TextAttributes {
    static var name: [String:Any] {
        return [NSForegroundColorAttributeName:UIColor.black,
                NSFontAttributeName:UIFont.boldSystemFont(ofSize: 15)]
    }

    static var username: [String:Any] {
        return [NSForegroundColorAttributeName:UIColor.lightGray,
                NSFontAttributeName:UIFont.boldSystemFont(ofSize: 15)]
    }
}
