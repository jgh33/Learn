//
//  ViewController.swift
//  04MediaPlayer
//
//  Created by jgh on 15/12/10.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class ViewController: UIViewController {
    let p = AVPlayerViewController()

    @IBAction func musicBtn(sender: AnyObject) {
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mp4Url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Written In The Stars", ofType: "mp4")!)
        let playerItem1 = AVPlayerItem(URL: mp4Url)
        playerItem1.addObserver(p, forKeyPath: "status", options: .New, context: nil)
        playerItem1.addObserver(p, forKeyPath: "loadedTimeRanges", options: .New, context: nil)
        p.player = AVPlayer(playerItem: playerItem1)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MVBtn(sender: AnyObject) {

                        presentViewController(p, animated: true, completion: nil)
    }

}

