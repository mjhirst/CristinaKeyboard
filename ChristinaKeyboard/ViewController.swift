//
//  ViewController.swift
//  ChristinaKeyboard
//
//  Created by Marcus Hirst on 27/11/2015.
//  Copyright © 2015 Marcus. All rights reserved.
//

import UIKit
import Foundation
import Batch
import Firebase

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var ReplayIntroButton: UIButton!
    @IBOutlet var GotIt: UIButton!
    @IBOutlet var RegisterPush: UIButton!
    
    @IBOutlet var ChristinaLabel: UILabel!
    
    override func viewDidLoad() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let name = defaults.stringForKey("intro")
        if name != "read" {
            loadintro()
            defaults.setObject("read", forKey: "intro")
            
        }
        
        view.backgroundColor = UIColor(colorLiteralRed:0.886, green:0.890, blue:0.914, alpha:1.000)
        
        self.GotIt.hidden = true
        self.scrollView.hidden = true
        self.pageControl.hidden = true
        
        let notificationType = UIApplication.sharedApplication().currentUserNotificationSettings()!.types
        if notificationType == UIUserNotificationType.None {
            // Push notifications are disabled in setting by user.
            //RegisterPush.hidden = false
        } else {
            // Push notifications are enabled in setting by user.
            //RegisterPush.hidden = true
        }
        
        if (BatchPush.lastKnownPushToken() != nil){
            //User has Push
            let defaults = NSUserDefaults(suiteName: "group.com.marcushirst.ChristinaKeyboard")
            let batch = BatchPush.lastKnownPushToken()
            defaults!.setObject("\(batch!)", forKey: "UUID")
            
        } else {
            
        }
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func RegisterForNotifications() {
        
        BatchPush.registerForRemoteNotifications()
        
        FIRAuth.auth()!.signInAnonymouslyWithCompletion() { (user, error) in
            if let error = error {
                log.error("Sign in failed:", error.localizedDescription)
            } else {
                log.info ("Signed in with uid:", user!.uid)
                let editor = BatchUser.editor()
                editor.setIdentifier(user!.uid)
                editor.save()
            }
        }

    }
    @IBAction func FinishIntro(sender: UIButton) {
        self.scrollView.hidden = true
        self.GotIt.hidden = true
        self.pageControl.hidden = true
        log.info("Completed Onboarding")
        RegisterForNotifications()
        
    }
    @IBAction func ReplayIntro(sender: UIButton) {
        loadintro()
    }
    func loadintro() {
        pageImages = [UIImage(named: "intro-1.png")!, UIImage(named: "intro-2.png")!, UIImage(named: "intro-3.png")!]
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageImages.count
        for _ in 0..<pageImages.count {
            pageViews.append(nil)
        }
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count),
                                        height: pagesScrollViewSize.height)
        scrollView.center = view.center;
        self.scrollView.hidden = false
        self.GotIt.hidden = false
        self.pageControl.hidden = false
        loadVisiblePages()
    }
    
/*    func checkupdate() {
        
        self.UpdateButton.hidden = true
        self.UpdateText.text = "No Update Available"
        
        //Ue5CTWthR2 contains a version string
        let query = PFQuery(className:"Data")
        query.getObjectInBackgroundWithId("Ue5CTWthR2") {
            (version: PFObject?, error: NSError?) -> Void in
            if error == nil && version != nil {
                print(version)
                let versionString = version!["Value"] as! NSString
                print (versionString)
                let RemoteVersionNo = versionString.floatValue
                print(RemoteVersionNo)
                let nsObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
                print (nsObject)
                let Appversion = nsObject as! NSString
                let AppVersionNo = Appversion.floatValue
                print(AppVersionNo)
                if AppVersionNo < RemoteVersionNo {
                    self.UpdateButton.hidden = false
                    self.UpdateText.text = "New v\(RemoteVersionNo) Available"
                }
            } else {
                print(error)
                self.UpdateButton.hidden = true
                self.UpdateText.text = "No Update Available"
            }
        }
    }
*/
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        // 1
        if pageViews[page] != nil {
        //if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for index in firstPage.stride(to: -1, by: 1) {
            purgePage(index)
        }
  //      for var index = 0; index < firstPage; ++index {
  //         purgePage(index)
  //      }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for index in lastPage.stride(to: pageImages.count+1, by: 1) {
            purgePage(index)
        }
  //      for var index = lastPage+1; index < pageImages.count; ++index{
  //          purgePage(index)
  //      }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

