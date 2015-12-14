//
//  ViewController.swift
//  06二维码扫描
//
//  Created by jgh on 15/12/11.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate{
    
    var captureSession:AVCaptureSession!
    var videoPreviewLayer:AVCaptureVideoPreviewLayer!
    var qrCodeFrameView:UIView!
    

    @IBAction func two(sender: AnyObject) {
        
    }
    @IBAction func one(sender: AnyObject) {
        captureSession.startRunning()
        
        qrCodeFrameView = UIView()
        qrCodeFrameView.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView)
        view.bringSubviewToFront(qrCodeFrameView)
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice)
            let captureMetadataOutput =  AVCaptureMetadataOutput()
            captureSession = AVCaptureSession()
            captureSession.addInput(input)
            captureSession.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer)
            
        }catch let error as NSError {
            print("\(error.localizedDescription)")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0{
            qrCodeFrameView.frame = CGRectZero
            print("NONE")
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObjectTypeQRCode{
            let barCodeObject = videoPreviewLayer.transformedMetadataObjectForMetadataObject(metadataObj)
            qrCodeFrameView.frame = barCodeObject.bounds
            if metadataObj.stringValue != nil{
                print("The string of the qrcode is \(metadataObj.stringValue)")
                let aviewC = UIViewController()
                let aview = UIView()
                let alabel = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 30))
                alabel.text = metadataObj.stringValue
                aview.addSubview(alabel)
                aviewC.view = aview
                presentViewController(aviewC, animated: true, completion: nil)
            }
        }
    }


}

