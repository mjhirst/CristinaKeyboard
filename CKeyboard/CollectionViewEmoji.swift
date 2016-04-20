//
//  CollectionViewEmoji.swift
//  ChristinaKeyboard
//
//  Created by Marcus Hirst on 20/04/2016.
//  Copyright © 2016 Marcus. All rights reserved.
//

import UIKit

class CollectionViewEmoji: UICollectionViewCell {
    var textView: UILabel!
    
    override init(frame: CGRect) {
        
        
        textView = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        textView.userInteractionEnabled = false
        textView.backgroundColor = UIColor.clearColor()
        textView.textAlignment = .Center
        textView.font = UIFont.systemFontOfSize(30)
        
        super.init(frame: frame)
        contentView.addSubview(textView)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}