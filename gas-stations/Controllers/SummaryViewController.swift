//
//  SummaryViewController.swift
//  gas stations
//
//  Created by Alexey Tsymlov on 4/23/16.
//  Copyright © 2016 IPS. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var valueTextField: UITextField!{
        didSet{
            valueTextField.becomeFirstResponder()
        }
    }
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)
        }
    }
    
    @IBAction func changeValueOfSegmentedControl() {
        valueTextField.hidden = segmentedControl.selectedSegmentIndex == SegmentIndexes.FullTank.rawValue
    }
    
    enum SegmentIndexes: Int{
        case Roubles = 0, Litres, FullTank
    }
    
    @IBAction func changeEditing() {
                nextButton.enabled = (!(valueTextField.text?.isEmpty ?? true)) && (Int(valueTextField.text ?? "") ?? 0) != 0
    }
}
