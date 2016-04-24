//
//  ProgressViewController.swift
//  gas stations
//
//  Created by Alexey Tsymlov on 4/23/16.
//  Copyright © 2016 IPS. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var timer: NSTimer!
    private let successSegueID = "Show Success"
    private let progressDuration: NSTimeInterval = 5
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(progressDuration, target: self, selector: #selector(elapseTimer), userInfo: nil, repeats: false)
    }
    
    func elapseTimer(sender: NSTimer){
        goToSuccessScreen()
    }
    
    private func goToSuccessScreen(){
        performSegueWithIdentifier(successSegueID, sender: self)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func touchCancelButton() {
        navigationController?.popViewControllerAnimated(true)
    }
}
