//
//  ViewController.swift
//  Mask
//
//  Created by Jack Cook on 3/8/15.
//  Copyright (c) 2015 Jack Cook. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var instructions: UILabel!
    
    var laid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        if !laid {
            for i in 0...4 {
                let image = UIImage(named: "s\(i + 1).jpg")
                let imageView = UIImageView(image: image)
                imageView.frame = CGRectMake(scrollView.frame.size.width * CGFloat(i), 0, scrollView.frame.size.width, scrollView.frame.size.height)
                println(NSStringFromCGRect(imageView.frame))
                scrollView.addSubview(imageView)
            }
            
            let size = CGSizeMake(scrollView.frame.size.width * 5, scrollView.frame.size.height)
            scrollView.contentSize = size
            
            laid = true
        }
    }
    
    func updateLabel() {
        switch pageControl.currentPage {
        case 0:
            instructions.text = "In the Settings app, tap \"General\""
        case 1:
            instructions.text = "In the General pane, tap \"VPN\""
        case 2:
            instructions.text = "In the VPN pane, tap \"Add VPN Configuration...\""
        case 3:
            instructions.text = "In the New VPN pane, set up a VPN as follows"
        case 4:
            instructions.text = "Tap the \"Connected\" switch to connect to the network"
        default:
            instructions.text = "wat"
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        pageControl.currentPage = Int(page)
        updateLabel()
    }
    
    @IBAction func changePage(sender: AnyObject) {
        let frame = CGRectMake(scrollView.frame.size.width * CGFloat(pageControl.currentPage), 0, scrollView.frame.size.width, scrollView.frame.size.height)
        scrollView.scrollRectToVisible(frame, animated: true)
        updateLabel()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
