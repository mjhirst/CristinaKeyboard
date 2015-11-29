//
//  ItemModel.swift
//  ChristinaKeyboard
//
//  Created by Marcus on 29/11/2015.
//  Copyright © 2015 Marcus. All rights reserved.
//

import Foundation

class ItemModel: NSObject {
    let url: String

    
    override var description: String {
        return "url: \(url)"
    }
    
    init(url: String?) {
        self.url = url ?? "nandemonai"
    }
}

struct Items {
    let url: String
}
