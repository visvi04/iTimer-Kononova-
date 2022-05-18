//
//  ViewController.swift
//  iTimer
//
//  Created by Student on 30.03.2022.
//

import UIKit

class TimerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timer: Timer = Timer()
    var counter: Double = 0.0
    
    var array: [String] = []
    
    @IBOutlet weak var stopwathOutput: UILabel!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    
    @IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(timerFinish), userInfo: nil, repeats: true)
    }
    
   
    @objc func timerFinish() {
        counter += 0.035
        var second: String = ""
        second = String(format: "%.2f", counter)
        var minute: String = ""
        if Int(counter / 60) < 10 {
            minute = "0" + String(Int(counter / 60))
        } else {
            minute = String(Int(counter / 60))
        }
        if counter < 10 {
            second = "0" + String(format: "%.1f", counter)
        } else {
           second = String(format: "%.2f", counter)
        }
        stopwathOutput.text = "\(minute):\(second)"
    }
    
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate()
        stopwathOutput.text = "00:00:00"
        counter = 0
        array.removeAll()
        table.reloadData()
    }
    @IBAction func timerLab(_ sender: UIButton) {
        array.append(stopwathOutput.text!)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath) as! row
        
        cell.row.text = array[indexPath.row]
        
        return cell
    }
}


class row: UITableViewCell {
    
    @IBOutlet weak var row: UILabel!
    
}
