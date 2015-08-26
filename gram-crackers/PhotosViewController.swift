//
//  PhotosViewController.swift
//  gram-crackers
//
//  Created by Bill Eager on 8/26/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    let apiUrl = "https://api.instagram.com/v1/media/popular?client_id=88028909273e4f08842918e6c4734d90"
    
    var photos = NSArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var url = NSURL(string: self.apiUrl)!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
            
            NSLog("response: \(self.photos)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
