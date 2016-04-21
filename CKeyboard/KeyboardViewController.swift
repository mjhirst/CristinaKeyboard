//
//  KeyboardViewController.swift
//  CKeyboard
//
//  Created by Marcus Hirst on 27/11/2015.
//  Copyright © 2015 Marcus. All rights reserved.
//

import UIKit
import MobileCoreServices

class KeyboardViewController: UIInputViewController, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var DismissKeyboardButton: UIButton!
    @IBOutlet var BackspaceKeyboardButton: UIButton!
    
    @IBOutlet var SaveModeButton: UIButton!
    @IBOutlet var GiphyModeButton: UIButton!
    @IBOutlet var TextModeButton: UIButton!
    @IBOutlet var EmojiModeButton: UIButton!
    var state = "save"

    
    @IBOutlet var CopiedImage: UIImageView!
    @IBOutlet var CopiedTextView: UILabel!
    
    @IBOutlet var NumberOfChristinas: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewButton: UIButton!
    
    let myImages=["image-1.gif","image-2.gif","image-3.gif","image-4.gif","image-5.gif","image-6.gif","image-7.gif","image-8.gif","image-9.gif","image-10.gif","image-11.gif","image-12.gif","image-13.gif","image-14.gif","image-15.gif","image-16.gif","image-17.gif","image-18.gif","image-19.gif","image-20.gif","image-21.gif","image-22.gif","image-23.gif","image-24.gif","image-25.gif","image-26.gif","image-27.gif","image-28.gif","image-29.gif","image-30.gif","image-31.gif","image-32.gif","image-33.gif","image-34.gif","image-35.gif","image-36.gif","image-37.gif","image-38.gif","image-39.gif","image-40.gif","image-41.gif","image-42.gif","image-43.gif" ,"image-44.gif" ,"image-45.gif" ,"image-46.gif" ,"image-47.gif" ,"image-48.gif" ,"image-49.gif" ,"image-50.gif" ,"image-51.gif" ,"image-52.gif" ,"image-53.gif" ,"image-54.gif" ,"image-55.gif" ,"image-56.gif" ,"image-57.gif" ,"image-58.gif" ,"image-59.gif" ,"image-60.gif" ,"image-61.gif" ,"image-62.gif" ,"image-63.gif" ,"image-64.gif" ,"image-65.gif" ,"image-66.gif" ,"image-67.gif"]
    

    
    let myImagesGifless=["image-1","image-2","image-3","image-4","image-5","image-6","image-7","image-8","image-9","image-10","image-11","image-12","image-13","image-14","image-15","image-16","image-17","image-18","image-19","image-20","image-21","image-22","image-23","image-24","image-25","image-26","image-27","image-28","image-29","image-30","image-31","image-32","image-33","image-34","image-35","image-36","image-37","image-38","image-39","image-40","image-41","image-42","image-43" ,"image-44" ,"image-45" ,"image-46" ,"image-47" ,"image-48" ,"image-49" ,"image-50" ,"image-51" ,"image-52" ,"image-53" ,"image-54" ,"image-55" ,"image-56" ,"image-57" ,"image-58" ,"image-59" ,"image-60" ,"image-61" ,"image-62" ,"image-63", "image-64", "image-65", "image-66", "image-67"]
    
    let emojiRanges = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸","😹","😺","😻","😼","😽","😾","😿","🙀","👣","👤","👥","👶","👦","👧","👨","👩","👪","👨‍👩‍👧","👨‍👩‍👧‍👦","👨‍👩‍👦‍👦","👨‍👩‍👧‍👧","👩‍👩‍👦","👩‍👩‍👧","👩‍👩‍👧‍👦","👩‍👩‍👦‍👦","👩‍👩‍👧‍👧","👨‍👨‍👦","👨‍👨‍👧","👨‍👨‍👧‍👦","👨‍👨‍👦‍👦","👨‍👨‍👧‍👧","👫","👬","👭","👯","👰","👱","👲","👳","👴","👵","👮","👷","👸","💂","👼","🎅","👻","👹","👺","💩","💀","👽","👾","🙇","💁","🙅","🙆","🙋","🙎","🙍","💆","💇","💑","👩‍❤️‍👩","👨‍❤️‍👨","💏","👩‍❤️‍💋‍👩","👨‍❤️‍💋‍👨","🙌","👏","👂","👀","👃","👄","💋","👅","💅","👋","👍","👎","☝","👆","👇","👈","👉","👌","✌","👊","✊","✋","💪","👐","🙏","🌱","🌲","🌳","🌴","🌵","🌷","🌸","🌹","🌺","🌻","🌼","💐","🌾","🌿","🍀","🍁","🍂","🍃","🍄","🌰","🐀","🐁","🐭","🐹","🐂","🐃","🐄","🐮","🐅","🐆","🐯","🐇","🐰","🐈","🐱","🐎","🐴","🐏","🐑","🐐","🐓","🐔","🐤","🐣","🐥","🐦","🐧","🐘","🐪","🐫","🐗","🐖","🐷","🐽","🐕","🐩","🐶","🐺","🐻","🐨","🐼","🐵","🙈","🙉","🙊","🐒","🐉","🐲","🐊","🐍","🐢","🐸","🐋","🐳","🐬","🐙","🐟","🐠","🐡","🐚","🐌","🐛","🐜","🐝","🐞","🐾","⚡️","🔥","🌙","☀️","⛅️","☁️","💧","💦","☔️","💨","❄️","🌟","⭐️","🌠","🌄","🌅","🌈","🌊","🌋","🌌","🗻","🗾","🌐","🌍","🌎","🌏","🌑","🌒","🌓","🌔","🌕","🌖","🌗","🌘","🌝","🌜","🍅","🍆","🌽","🍠","🍇","🍈","🍉","🍊","🍋","🍌","🍍","🍎","🍏","🍐","🍑","🍒","🍓","🍔","🍕","🍖","🍗","🍘","🍙","🍚","🍛","🍜","🍝","🍞","🍟","🍡","🍢","🍣","🍤","🍥","🍦","🍧","🍨","🍩","🍪","🍫","🍬","🍭","🍮","🍯","🍰","🍱","🍲","🍳","🍴","🍵","☕️","🍶","🍷","🍸","🍹","🍺","🍻","🍼","🎀","🎁","🎂","🎃","🎄","🎋","🎍","🎑","🎆","🎇","🎉","🎊","🎈","💫","✨","💥","🎓","👑","🎎","🎏","🎐","🎌","🏮","💍","❤️","💔","💌","💕","💞","💓","💗","💖","💘","💝","💟","💜","💛","💚","💙","🏃","🚶","💃","🚣","🏊","🏄","🛀","🏂","🎿","⛄️","🚴","🚵","🏇","⛺️","🎣","⚽️","🏀","🏈","⚾️","🎾","🏉","⛳️","🏆","🎽","🏁","🎹","🎸","🎻","🎷","🎺","🎵","🎶","🎼","🎧","🎤","🎭","🎫","🎩","🎪","🎬","🎨","🎯","🎱","🎳","🎰","🎲","🎮","🎴","🃏","🀄️","🎠","🎡","🎢","🚃","🚞","🚂","🚋","🚝","🚄","🚅","🚆","🚇","🚈","🚉","🚊","🚌","🚍","🚎","🚐","🚑","🚒","🚓","🚔","🚨","🚕","🚖","🚗","🚘","🚙","🚚","🚛","🚜","🚲","🚏","⛽️","🚧","🚦","🚥","🚀","🚁","✈️","💺","⚓️","🚢","🚤","⛵️","🚡","🚠","🚟","🛂","🛃","🛄","🛅","💴","💶","💷","💵","🗽","🗿","🌁","🗼","⛲️","🏰","🏯","🌇","🌆","🌃","🌉","🏠","🏡","🏢","🏬","🏭","🏣","🏤","🏥","🏦","🏨","🏩","💒","⛪️","🏪","🏫","🇦🇺","🇦🇹","🇧🇪","🇧🇷","🇨🇦","🇨🇱","🇨🇳","🇨🇴","🇩🇰","🇫🇮","🇫🇷","🇩🇪","🇭🇰","🇮🇳","🇮🇩","🇮🇪","🇮🇱","🇮🇹","🇯🇵","🇰🇷","🇲🇴","🇲🇾","🇲🇽","🇳🇱","🇳🇿","🇳🇴","🇵🇭","🇵🇱","🇵🇹","🇵🇷","🇷🇺","🇸🇦","🇸🇬","🇿🇦","🇪🇸","🇸🇪","🇨🇭","🇹🇷","🇬🇧","🇺🇸","🇦🇪","🇻🇳","⌚️","📱","📲","💻","⏰","⏳","⌛️","📷","📹","🎥","📺","📻","📟","📞","☎️","📠","💽","💾","💿","📀","📼","🔋","🔌","💡","🔦","📡","💳","💸","💰","💎","🌂","👝","👛","👜","💼","🎒","💄","👓","👒","👡","👠","👢","👞","👟","👙","👗","👘","👚","👕","👔","👖","🚪","🚿","🛁","🚽","💈","💉","💊","🔬","🔭","🔮","🔧","🔪","🔩","🔨","💣","🚬","🔫","🔖","📰","🔑","✉️","📩","📨","📧","📥","📤","📦","📯","📮","📪","📫","📬","📭","📄","📃","📑","📈","📉","📊","📅","🔅","🔆","📜","📋","📖","📓","📔","📒","📕","📗","📘","📙","📚","📇","🔗","📎","📌","✂️","📐","📍","📏","🚩","📁","📂","✒️","✏️","📝","🔏","🔐","🔒","🔓","📣","📢","🔈","🔉","🔊","🔇","💤","🔔","🔕","💭","💬","🚸","🔍","🔎","🚫","⛔️","📛","🚷","🚯","🚳","🚱","📵","🔞","🉑","🉐","💮","㊙️","㊗️","🈴","🈵","🈲","🈶","🈚️","🈸","🈺","🈷","🈹","🈳","🈂","🈁","🈯️","💹","❇️","✳️","❎","✅","✴️","📳","📴","🆚","🅰","🅱","🆎","🆑","🅾","🆘","🆔","🅿️","🚾","🆒","🆓","🆕","🆖","🆗","🆙","🏧","♈️","♉️","♊️","♋️","♌️","♍️","♎️","♏️","♐️","♑️","♒️","♓️","🚻","🚹","🚺","🚼","♿️","🚰","🚭","🚮","▶️","◀️","🔼","🔽","⏩","⏪","⏫","⏬","➡️","⬅️","⬆️","⬇️","↗️","↘️","↙️","↖️","↕️","↔️","🔄","↪️","↩️","⤴️","⤵️","🔀","🔁","🔂","#⃣","0⃣","1⃣","2⃣","3⃣","4⃣","5⃣","6⃣","7⃣","8⃣","9⃣","🔟","🔢","🔤","🔡","🔠","ℹ️","📶","🎦","🔣","➕","➖","〰","➗","✖️","✔️","🔃","™","©","®","💱","💲","➰","➿","〽️","❗️","❓","‼️","⁉️","❌","⭕️","💯","🔚","🔙","🔛","🔝","🔜","🌀","Ⓜ️","⛎","🔯","🔰","🔱","⚠️","♨️","♻️","💢","💠","♠️","♣️","♥️","♦️","☑️","⚪️","⚫️","🔘","🔴","🔵","🔺","🔻","🔸","🔹","🔶","🔷","▪️","▫️","⬛️","⬜️","◼️","◻️","◾️","◽️","🔲","🔳","🕐","🕑","🕒","🕓","🕔","🕕","🕖","🕗","🕘","🕙","🕚","🕛","🕜","🕝","🕞","🕟","🕠","🕡","🕢","🕣","🕤","🕥","🕦","🕧"]

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //Let's use a NIB
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as! UIView;
        view.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        self.CopiedImage.hidden = true
        self.CopiedTextView.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        collectionView.reloadData()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red:0.957, green:0.953, blue:0.957, alpha:1.000)
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var size = CGSizeMake(collectionView.frame.size.width / 3.2, collectionView.frame.size.height / 2.2)
        
        if state == "emoji" {
        size.width += 0 // add margin if necessary
        size.height += 0 // calculated text height or any value you want
        let str = emojiRanges[indexPath.item] // string to show in label
        // calculate size. you can use -boundingRectWithSize: as well
        size = (str as NSString).sizeWithAttributes([ NSFontAttributeName : UIFont.systemFontOfSize(30)]) // specify label's font
        
        }

        return size
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count = 1
        if state == "save" {
            count = myImages.count
        }
        //if state == "giphy" {
        //     count = 1
        //}
        //if state == "text" {
        //     count = myTextImages.count
        //}
        if state == "emoji" {
            count = emojiRanges.count
        }
        
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        
        //TODO: Love GIF Support
        //cell.imageView.image = UIImage.gifWithName(self.myImagesGifless[indexPath.row])
        
        collectionView.pagingEnabled = false
        cell.imageView.hidden = false
        cell.textView.hidden = true
        
        if state == "save" {
            //cell.imageView.image = UIImage(named:myImages[indexPath.row])
            cell.imageView.image = UIImage.gifWithName(myImagesGifless[indexPath.row])
            collectionView.pagingEnabled = false
            cell.imageView.hidden = false
            cell.textView.hidden = true
        }
        //if state == "giphy" {cell.imageView.image = UIImage(named: "giphy_logo.gif")
        //    collectionView.pagingEnabled = false
        //    cell.imageView.hidden = false
        //    cell.textView.hidden = true
        //}
        //if state == "text" {cell.imageView.image = UIImage(named:myTextImages[indexPath.row])
        //    collectionView.pagingEnabled = false
        //    cell.imageView.hidden = false
        //    cell.textView.hidden = true
       //}
        if state == "emoji" {
            cell.textView.text = emojiRanges[indexPath.row]
            collectionView.pagingEnabled = true
            cell.imageView.hidden = true
            cell.textView.hidden = false
        }

        cell.backgroundColor = UIColor.clearColor()
        cell.tag = indexPath.row + 1
        
        return cell
        
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
     print(indexPath.row)
        
        if state == "emoji" {
            self.textDocumentProxy.insertText(emojiRanges[indexPath.row])
            
        } else {

        if (isOpenAccessGranted() == false) {
            
            self.CopiedTextView.text = "Please Allow Access"
            self.CopiedTextView.hidden = false
            self.CopiedImage.image = UIImage(named: "433-x@2x.png")
            self.CopiedImage.hidden = false
            
            } else {
            
                if state == "save" {
                        let tag = indexPath.row + 1
                        let url: NSURL = NSBundle.mainBundle().URLForResource("image-\(tag)", withExtension: ".gif")!
                        let data: NSData = NSData(contentsOfURL: url)!
                        UIPasteboard.generalPasteboard().setData(data, forPasteboardType: "com.compuserve.gif")
                }
                if state == "text" {
                
                }
            
            self.CopiedImage.hidden = false
            self.CopiedImage.image = UIImage(named: "888-checkmark@2x.png")
            self.CopiedTextView.hidden = false
            self.CopiedTextView.text = "Christina Copied"
            
        }
        
    }
    }
    
/*    func SaveState() {
        
        let imageWidth: CGFloat = 150
        let imageHeight: CGFloat = 120
        var xPosition: CGFloat = 0
        var scrollViewContentSize:CGFloat=0;
        for var index = 0; index < myImages.count; index++
            
        {   let MyButton: UIButton = UIButton()
            
            MyButton.setImage(UIImage (named: myImages[index])!, forState: .Normal)
            MyButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
            MyButton.frame.size.width = imageWidth
            MyButton.frame.size.height = imageHeight
            MyButton.center = self.view.center
            MyButton.frame.origin.x = xPosition
            MyButton.frame.origin.y = 5
            MyButton.addTarget(self, action: "KeyPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            MyButton.tag = index + 1
            self.scrollView.addSubview(MyButton)
            
            let spacer:CGFloat = 5
            
            xPosition += imageWidth + spacer
            scrollViewContentSize += imageWidth + spacer
            
            self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: imageHeight)
        }
    }
    
    func GiphyState() {
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        var items = [ItemModel]()
        
        Alamofire.request(.GET, "http://api.giphy.com/v1/gifs/search?q=christina+yang&limit=40&api_key=dc6zaTOxFJmzC")
            .responseJSON(){ request, response, result in
                
                self.NumberOfChristinas.text = "\((JSON(result.value!)["data"].count))"
                
                let itemArray = JSON(result.value!)["data"].array!
                
                for itemDict in itemArray {
                    let url: String? = itemDict["url"].string
                    
                    let item = ItemModel(url: url)
                    items.append(item)
                }
                

                }
                
                let imageWidth: CGFloat = 150
                let imageHeight: CGFloat = 120
                var xPosition: CGFloat = 0
                var scrollViewContentSize:CGFloat=0;
                for var index = 0; index < items.count; index++
                    
                {   let MyButton: UIButton = UIButton()
                    
                    if let url  = NSURL(string: items[index].url),
                        data = NSData(contentsOfURL: url)
                    {
                        MyButton.setImage(UIImage (data: data), forState: .Normal)
                    }
                    MyButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
                    MyButton.frame.size.width = imageWidth
                    MyButton.frame.size.height = imageHeight
                    MyButton.center = self.view.center
                    MyButton.frame.origin.x = xPosition
                    MyButton.frame.origin.y = 5
                    MyButton.addTarget(self, action: "KeyPressed:", forControlEvents: UIControlEvents.TouchUpInside)
                    MyButton.tag = index + 1
                    self.scrollView.addSubview(MyButton)
                    
                    let spacer:CGFloat = 5
                    
                    xPosition += imageWidth + spacer
                    scrollViewContentSize += imageWidth + spacer
                    
                    self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: imageHeight)
        }
        
    }
    
    func TextState() {
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let imageWidth: CGFloat = 150
        let imageHeight: CGFloat = 120
        var xPosition: CGFloat = 0
        var scrollViewContentSize:CGFloat=0;
        for var index = 0; index < myTextImages.count; index++
            
        {   let MyButton: UIButton = UIButton()
            
            MyButton.setImage(UIImage (named: myTextImages[index])!, forState: .Normal)
            MyButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
            MyButton.frame.size.width = imageWidth
            MyButton.frame.size.height = imageHeight
            MyButton.center = self.view.center
            MyButton.frame.origin.x = xPosition
            MyButton.frame.origin.y = 5
            MyButton.addTarget(self, action: "KeyPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            MyButton.tag = index + 1
            self.scrollView.addSubview(MyButton)
            
            let spacer:CGFloat = 5
            
            xPosition += imageWidth + spacer
            scrollViewContentSize += imageWidth + spacer
            
            self.scrollView.contentSize = CGSize(width: scrollViewContentSize, height: imageHeight)
        }
    }
    

    
    @IBAction func KeyPressed(sender: UIButton) {
        
        if (isOpenAccessGranted() == false) {
            
        self.CopiedTextView.text = "Allow Access"
        self.CopiedTextView.hidden = false
        self.CopiedImage.image = UIImage(named: "433-x@2x.png")
        self.CopiedImage.hidden = false

        } else {
            
        let tag = sender.tag
        let url: NSURL = NSBundle.mainBundle().URLForResource("image-\(tag)", withExtension: ".gif")!
        let data: NSData = NSData(contentsOfURL: url)!
        UIPasteboard.generalPasteboard().setData(data, forPasteboardType: "com.compuserve.gif")
        self.CopiedImage.hidden = false
        self.CopiedImage.image = UIImage(named: "888-checkmark@2x.png")
        self.CopiedTextView.hidden = false
        self.CopiedTextView.text = "Christina Copied"
        }
    }
*/
    @IBAction func ButtondismissKeyboard(sender: UIButton) {
        self.dismissKeyboard()
    }
    @IBAction func ButtonadvanceKeyboard(sender: UIButton) {
        self.advanceToNextInputMode()
    }
    @IBAction func ButtondeleteKeyboard(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    @IBAction func Switchmode(sender: UIButton){
        
        let mode = "\(sender.tag)"
        switch mode {
        case "500":
            self.SaveModeButton.backgroundColor = UIColor(white:0.965, alpha:1.000)
            //self.GiphyModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            //self.TextModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            self.EmojiModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            state = "save"
        //case "600":
        //    self.SaveModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    self.GiphyModeButton.backgroundColor = UIColor(white:0.965, alpha:1.000)
        //    self.TextModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    self.EmojiModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    state = "giphy"
        //case "700":
        //    self.SaveModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    self.GiphyModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    self.TextModeButton.backgroundColor = UIColor(white:0.965, alpha:1.000)
        //   self.EmojiModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        //    state = "text"
        case "800":
            self.SaveModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            //self.GiphyModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            //self.TextModeButton.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
            self.EmojiModeButton.backgroundColor = UIColor(white:0.965, alpha:1.000)
            state = "emoji"
        default:
            print("Default, try again")
        }
        
            collectionView.invalidateIntrinsicContentSize()
        collectionView.reloadData()
        collectionView.reloadInputViews()
            collectionView.reloadSections(NSIndexSet(index: 0))
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    func isOpenAccessGranted() -> Bool {
        return UIPasteboard.generalPasteboard().isKindOfClass(UIPasteboard)
    }
}