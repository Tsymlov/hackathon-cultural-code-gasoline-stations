//
//  SummaryViewController.swift
//  gas stations
//
//  Created by Alexey Tsymlov on 4/23/16.
//  Copyright © 2016 IPS. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet weak var roublesPickerView: UIPickerView!{
        didSet{
            roublesPickerView.selectRow(30-1, inComponent: 0, animated: true)
        }
    }
    @IBOutlet weak var litresPickerView: UIPickerView!
}

extension SummaryViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    enum PickerIDs: String {
        case Roubles = "Roubles"
        case Litres = "Litres"
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.restorationIdentifier ?? "" {
        case PickerIDs.Litres.rawValue:
            return 1000
        case PickerIDs.Roubles.rawValue:
            return 15000
        default:
            return 0
        }
    }
}

extension SummaryViewController: UIPickerViewDelegate{
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.restorationIdentifier ?? "" {
        case PickerIDs.Litres.rawValue:
            roublesPickerView.selectRow((row+1)*30-1, inComponent: 0, animated: true)
        case PickerIDs.Roubles.rawValue:
            let litres = (row+1) / 30
            let roubles = litres * 30
            litresPickerView.selectRow(litres-1, inComponent: 0, animated: true)
            roublesPickerView.selectRow(roubles-1, inComponent: 0, animated: true)
        default:
            break
        }
    }
}
