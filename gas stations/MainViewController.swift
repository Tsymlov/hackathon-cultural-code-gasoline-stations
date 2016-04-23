//
//  ViewController.swift
//  gas stations
//
//  Created by Alexey Tsymlov on 4/23/16.
//  Copyright © 2016 IPS. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController {
    
    private let userHash = "6FBE-A327-8081-B5A0"
    private let locationName = "Хлеб и Вино"
    private var currentPumpNumber = ""
    
    @IBOutlet private weak var mapView: MKMapView!{
        didSet{
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .FollowWithHeading
            mapView.mapType = .HybridFlyover
            mapView.showsBuildings = true
        }
    }
    
    @IBOutlet weak var whiteMask: UIView!
    @IBOutlet weak var pumpNumberLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    private var navigineCore: NavigineCore!{
        didSet{
            navigineCore?.delegate = self
        }
    }
    
    // MARK: - VC life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupNavigine()
    }
    
    private func setupNavigine(){
        navigineCore = NavigineCore.defaultCore()
        navigineCore.downloadContent(userHash, location: locationName, forceReload: false, processBlock: { (_) in}, successBlock: {
                self.navigineCore.startRangePushes()
                self.navigineCore.startNavigine()
        }) { (error) in
            guard error != nil else { return }
            print(error?.localizedDescription)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigineCore.stopNavigine() // For speed optimization
    }
    
    // MARK: - Actions
    
    @IBAction func touchSettings() {
    }
}

extension MainViewController: NavigineCoreDelegate{
    func didRangePushWithTitle(title: String!, content: String!, image: String!, id: Int) {
        guard let number = content else{
            return
        }
        if number != currentPumpNumber{
            mapView.userTrackingMode = .None
            mapView.setCenterCoordinate(mapView.centerCoordinate, zoomLevel: 17, animated: true)
            currentPumpNumber = number
            UIView.animateWithDuration(1){
                self.pumpNumberLabel.text = "Колонка №\(number)"
                self.pumpNumberLabel.hidden = false
                self.nextButton.hidden = false
                self.whiteMask.hidden = false
            }
        }
    }
}

