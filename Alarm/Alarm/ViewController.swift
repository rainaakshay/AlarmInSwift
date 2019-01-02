//
//  ViewController.swift
//  Alarm
//
//  Created by apple on 21/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var timeSelecter: UIDatePicker!
    @IBOutlet weak var alarmStatus: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var stopAlarmButton: UIButton!
    var flag = 0
    var count = 0
     var player = AVAudioPlayer()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopAlarmButton.isHidden = true
    }

    @IBAction func setAction(_ sender: UIButton) {
        let dateFormat = DateFormatter()
        dateFormat.timeStyle = .short
        
        let date : Date = (timeSelecter?.date)!
        var x = Calendar.current.dateComponents([.hour,.minute,.second], from: date)
        x.second = 0
        alarmStatus.text! = "Alarm set for " + dateFormat.string(from: date)
      //  let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        let timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    
    
    @IBAction func exitAction(_ sender: UIButton) {
     exit(0)
    }
    
    @objc func startTimer()
    {
        
//        var currTime = Date()
//        var cal = Calendar.current
//        var hour = cal.component(.hour, from: currTime)
//        var min = cal.component(.minute, from: currTime)
       timeLeft.text! = "Alarm time !"
        
        playSound()
        
        
        
        
    }
    @IBAction func stopAlarmAction(_ sender: Any) {
        
        player.stop()
        stopAlarmButton.isHidden = true
        flag = 0
        timeLeft.text! = ""
        
    }
    
    
    
    
    func playSound()
    {
        
        let path = Bundle.main.path(forResource: "alarm", ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.setVolume(5.0, fadeDuration: 10)
            player.play()
            flag = 1
            stopAlarmButton.isHidden = false
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stop), userInfo: nil, repeats: true)
            
        } catch {
            
            print ("There is an issue with this code!")
            
        }
        
    }
//    @objc func stop()
//    {
//        let endtime = 5.0
//        if player.currentTime == endtime
//        {
//            player.stop()
//            timer.invalidate()
//        }
//
//        }
    
    
    
}

