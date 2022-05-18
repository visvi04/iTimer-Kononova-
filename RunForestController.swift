//
//  ViewController.swift
//  iTimer
//
//  Created by Student on 30.03.2022.
//

import UIKit

class RunForestController: UIViewController {

    var timer: Timer = Timer()
    
    @objc func timerFinish() {
        print("Tik")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    @IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFinish), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate()
    }
}
