//
//  Feedback.swift
//  ChristinaKeyboard
//
//  Created by Marcus on 31/05/2016.
//  Copyright © 2016 Marcus. All rights reserved.
//

import Foundation
import Firebase

class Feedback: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var message: UITextView!
    @IBOutlet var sendButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func sendButtonWasPressed(sender: UIBarButtonItem){
        
        let ref = FIRDatabase.database().reference()
        
        let defaults = NSUserDefaults(suiteName: "group.com.marcushirst.ChristinaKeyboard")
        let Uuid = defaults!.stringForKey("UUID")
        let version = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
        let country = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode)
        
        let post = ["Name":"\(self.name.text!)",
                    "Email":"\(self.email.text!)",
                    "Message":"\(self.message.text)",
                    "UUID":"\(Uuid)",
                    "Version":"\(version)",
                    "Country":"\(country)"]
        
        ref.child("feedback").childByAutoId().setValue(post)
        
        let alert = UIAlertController(title: "Feedback Sent", message: "Thank you for taking the time to send me feedback. I'm an independent developer and very much appreciate it. I will follow your action up should it require it and if you left an email address.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        self.name.text = ""
        self.email.text = ""
        self.message.text = ""
    }
}