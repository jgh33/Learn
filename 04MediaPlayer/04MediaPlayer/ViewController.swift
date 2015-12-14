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
import MediaPlayer
@IBAction func AVPlayerBtn(sender: UIButton) {
    @IBAction func one(sender: AnyObject) {
    }
}

class ViewController: UIViewController,MPMediaPickerControllerDelegate {
    var player:MPMusicPlayerController!
    var picker:MPMediaPickerController!


    @IBAction func musicBtn(sender: AnyObject) {
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("蜀绣", ofType: "mp3")!)
        let mpVC = MPMoviePlayerViewController(contentURL: url)
        presentViewController(mpVC, animated: true, completion: nil)
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picker = MPMediaPickerController(mediaTypes: MPMediaType.Music)
        picker.allowsPickingMultipleItems = true
        picker.delegate = self
//       
        player = MPMusicPlayerController.iPodMusicPlayer()
        
//        let mp4Url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Written In The Stars", ofType: "mp4")!)
//        let playerItem1 = AVPlayerItem(URL: mp4Url)
//        playerItem1.addObserver(p, forKeyPath: "status", options: .New, context: nil)
//        playerItem1.addObserver(p, forKeyPath: "loadedTimeRanges", options: .New, context: nil)
//        p.player = AVPlayer(playerItem: playerItem1)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MVBtn(sender: AnyObject) {
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Written In The Stars", ofType: "mp4")!)
        let mpVC = MPMoviePlayerViewController(contentURL: url)
        presentViewController(mpVC, animated: true, completion: nil)

                        
    }

    @IBAction func selectBtn(sender: AnyObject) {
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("mp")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
        player.setQueueWithItemCollection(mediaItemCollection)
        player.play()
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("mpc")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

