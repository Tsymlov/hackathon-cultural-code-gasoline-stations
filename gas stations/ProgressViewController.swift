//
//  ProgressViewController.swift
//  gas stations
//
//  Created by Alexey Tsymlov on 4/23/16.
//  Copyright © 2016 IPS. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func touchCancelButton() {
        navigationController?.popViewControllerAnimated(true)
    }
}
