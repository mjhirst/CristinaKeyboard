//
//  CollectionViewCell.swift
//  ChristinaKeyboard
//
//  Created by Marcus Hirst on 07/02/2016.
//  Copyright © 2016 Marcus. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var textView: UILabel!
    
override init(frame: CGRect) {
    
    let size: CGRect = UIScreen.mainScreen().bounds
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width * 0.34, height: size.height * 0.205))
    
    //imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenSize.width * 0.34, height: screenSize.width * 0.207))
    //imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 70))
    imageView.contentMode = UIViewContentMode.ScaleAspectFill
    imageView.clipsToBounds = true
    imageView.backgroundColor = UIColor.clearColor()
    
    textView = UILabel(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    textView.userInteractionEnabled = false
//    textView.selectable = false
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