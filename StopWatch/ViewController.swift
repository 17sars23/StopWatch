//
//  ViewController.swift
//  StopWatch
//
//  Created by kawagishi on 2018/02/05.
//  Copyright © 2018年 juna Kawagishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //-----------------------------------------
    // Setting variables
    //-----------------------------------------
    @IBOutlet var label: UILabel!
    @IBOutlet var label_p: UILabel!

    var count:Float = 0.0
    var differ:Float = 0.0
    var ten:Float = 10.0
    var timer:Timer = Timer()
    
    
    //-----------------------------------------
    // Setting function
    //-----------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-----------------------------------------
    // Setting original function
    //-----------------------------------------
    @objc func up(){
        count += 0.01
        label.text = String(format:"%.2f", count)
    }
    
    //judgement
    func judge(){
        differ = ten - count
        
        if -0.2 <= differ && differ <= 0.2{
            label_p.text = "PERFECT!"
            label_p.textColor = UIColor.red
        }else if -0.3 <= differ && differ <= 0.3{
            label_p.text = "GREAT!"
            label_p.textColor = UIColor.yellow
        }else if -0.5 <= differ && differ <= 0.5{
            label_p.text = "GOOD"
            label_p.textColor = UIColor.green
        }else{
            label_p.text = "BAD"
            label_p.textColor = UIColor.blue
        }
    }
    
    //Start
    @IBAction func start(){
        label_p.text = ""
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up),
                                         userInfo: nil, repeats: true )
        }
    }
    
    //Stop
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate() //invalidate:無効にする
        }
        self.judge()
    }
    
    //Reset
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format:"%.2f", count)
        label_p.text = ""
     }

}

