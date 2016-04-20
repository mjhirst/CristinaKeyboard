//
//  CollectionViewEmoji.swift
//  ChristinaKeyboard
//
//  Created by Marcus Hirst on 20/04/2016.
//  Copyright © 2016 Marcus. All rights reserved.
//

import UIKit

class CollectionViewEmoji: UICollectionViewCell {
    var imageView: UIImageView!
    var textView: UILabel!
    
    override init(frame: CGRect) {
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.clearColor()
        
        textView = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        textView.userInteractionEnabled = false
        textView.backgroundColor = UIColor.clearColor()
        textView.textAlignment = .Center
        textView.font = UIFont.systemFontOfSize(30)
        
        super.init(frame: frame)
        contentView.addSubview(textView)
        contentView.addSubview(imageView)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}