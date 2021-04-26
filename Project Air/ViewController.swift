//
//  ViewController.swift
//  Project Air
//
//  Created by Jason Marsh on 4/24/21.
//

import UIKit

//  View Controller class...
class ViewController: UIViewController {
    
//  Connect view objects as class properties...
    @IBOutlet weak var topAreaColor: UIStackView!       // color object
    @IBOutlet weak var headerLabel: UILabel!            // header object
    @IBOutlet weak var subtextLabel: UILabel!           // subtext object
    @IBOutlet weak var timerLabel: UILabel!             // timer object
    @IBOutlet weak var resetButton: UIButton!           // reset btn object
    @IBOutlet weak var envControl: UISegmentedControl!  // 'environment' segmented control object
    @IBOutlet weak var ventControl: UISegmentedControl! // 'ventilation' segmented control object
    @IBOutlet weak var distControl: UISegmentedControl! // 'distancing' segmented control object
    @IBOutlet weak var talkControl: UISegmentedControl! // 'talking' segmented control object
    @IBOutlet weak var maskControl: UISegmentedControl! // 'masking' segmented control object
    @IBOutlet weak var envKey: UILabel!                 // 'environment' key label
    @IBOutlet weak var ventKey: UILabel!                // 'ventilation' key label
    @IBOutlet weak var distKey: UILabel!                // 'distancing' key label
    @IBOutlet weak var talkKey: UILabel!                // 'talking' key label
    @IBOutlet weak var maskKey: UILabel!                // 'masking' key label
    @IBOutlet weak var envValue: UILabel!               // 'environment' value label
    @IBOutlet weak var ventValue: UILabel!              // 'ventilation' value label
    @IBOutlet weak var distValue: UILabel!              // 'distancing' value label
    @IBOutlet weak var talkValue: UILabel!              // 'talking' value label
    @IBOutlet weak var maskValue: UILabel!              // 'masking' value label
    
//  Set up class property initializers...
    var timer:Timer = Timer()                           // 'timer' property
    var count:Int = 0                                   // 'count' property of type int
    var timerCounting:Bool = false                      // 'timerCounting' property to say whether it's counting
    
//  When the view loads...
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//      Start controller values on left side so they can be animated later
        
//      Set 'Timer' starting attributes here...
        timerLabel.layer.masksToBounds = true   // enabled corner radius
        timerLabel.layer.cornerRadius = 6       // round corners
        
//      Set 'Reset' button starting attributes here...
        resetButton.layer.cornerRadius = 6      // round corners
                
    }
    
//  When 'Environment' segment control is selected...
    @IBAction func envSelected(_ sender: Any) {

//      and 'Outside' is selected...
        if envControl.selectedSegmentIndex == 0 {
            envKey.isEnabled = false                        // Left label disabled
            envValue.isHidden = false                       // Right label unhidden
            envValue.text = "Outside"                       // Right label text changed
//            UIView.animate(withDuration: 10) {
//                // Figure out some way to animate in right side text from the left
//            }
            ventControl.selectedSegmentIndex = -1           // 'Ventilation' segmented ctrlr unselected
            ventControl.isEnabled = false                   // 'Ventilation' segmented ctrlr disabled
            ventKey.isEnabled = false                       // 'Ventilation' left label disabled
            ventKey.text = "Ventilation"                    // 'Ventilation' left label is 'Ventilation'
            ventValue.isHidden = true                       // 'Ventilation' right label hidden
            ventControl.setImage(
                UIImage(
                    named: "2 - Ventilated - XS"
                ), forSegmentAt: 0
            )                       // 'Ventilation' left icon is 'fan'
            ventControl.setImage(
                UIImage(
                    named: "2 - Not Ventilated - XS"
                ), forSegmentAt: 1
            )                       // 'Ventilation' right icon is 'no fan'
            distControl.setEnabled(true, forSegmentAt: 1)   // 'Distancing' middle selection enabled
        }

//      and 'Indoors' is selected...
        else if envControl.selectedSegmentIndex == 1 {
            envKey.isEnabled = false                        // Left label disabled
            envValue.isHidden = false                       // Right label unhidden
            envValue.text = "Indoors"                       // Right label text changed
//            UIView.animate(withDuration: 10) {
//                // Figure out some way to animate in right side text from the left
//            }
            ventControl.isEnabled = true                    // 'Ventilation' segmented ctrlr enabled
            ventKey.isEnabled = true                        // 'Ventilation' left label enabled
            ventKey.text = "Ventilation"                    // 'Ventilation' left label is 'Ventilation'
            ventControl.setImage(
                UIImage(
                    named: "2 - Ventilated - XS"
                ), forSegmentAt: 0
            )                       // 'Ventilation' left icon is 'fan'
            ventControl.setImage(
                UIImage(
                    named: "2 - Not Ventilated - XS"
                ), forSegmentAt: 1
            )                       // 'Ventilation' right icon is 'no fan'
            distControl.setEnabled(true, forSegmentAt: 1)   // 'Distancing' middle selection enabled

        }

//      and 'Tent' is selected...
        else if envControl.selectedSegmentIndex == 2 {
            envKey.isEnabled = false                        // Left label disabled
            envValue.isHidden = false                       // Right label unhidden
            envValue.text = "Tent"                          // Right label text changed
//            UIView.animate(withDuration: 10) {
//                // Figure out some way to animate in right side text from the left
//            }
            ventControl.isEnabled = true                   // 'Ventilation' segmented ctrlr enabled
            ventKey.isEnabled = true                       // 'Ventilation' left label enabled
            ventKey.text = "Ventilation"                    // 'Ventilation' left label is 'Ventilation'
            ventControl.setImage(
                UIImage(
                    named: "2 - Ventilated - XS"
                ), forSegmentAt: 0
            )                       // 'Ventilation' left icon is 'fan'
            ventControl.setImage(
                UIImage(
                    named: "2 - Not Ventilated - XS"
                ), forSegmentAt: 1
            )                       // 'Ventilation' right icon is 'no fan'
            distControl.setEnabled(true, forSegmentAt: 1)   // 'Distancing' middle selection enabled

        }

//      and 'Car' is selected...
        else if envControl.selectedSegmentIndex == 3 {
            envKey.isEnabled = false                        // Left label disabled
            envValue.isHidden = false                       // Right label unhidden
            envValue.text = "Car"                          // Right label text changed
//            UIView.animate(withDuration: 10) {
//                // Figure out some way to animate in right side text from the left
//            }
            ventControl.isEnabled = true                   // 'Ventilation' segmented ctrlr enabled
            ventKey.isEnabled = true                       // 'Ventilation' left label enabled
            ventKey.text = "Windows"                        // 'Ventilation' left label is 'Windows'
            ventControl.setImage(
                UIImage(
                    named: "2 - Door Open - XS"
                ), forSegmentAt: 0
            )                       // 'Ventilation' left icon is 'door open'
            ventControl.setImage(
                UIImage(
                    named: "2 - Door Closed - XS"
                ), forSegmentAt: 1
            )                       // 'Ventilation' right icon is 'door closed'
            distControl.setEnabled(false, forSegmentAt: 1)   // 'Distancing' middle selection disled
        }
        
//      and nothing is selected...
        else {
            envKey.isEnabled = true                        // Left label enabled
            envValue.isHidden = true                       // Right label hidden
//            UIView.animate(withDuration: 10) {
//                // Figure out some way to animate out right side text from the right
//            }
            ventControl.isEnabled = true                   // 'Ventilation' segmented ctrlr enabled
            ventKey.isEnabled = true                       // 'Ventilation' left label enabled
            ventKey.text = "Ventilation"                   // 'Ventilation' left label is 'Ventilation'
        }
    }

//  When 'Ventilation' segment control is selected...
    @IBAction func ventSelected(_ sender: Any) {
        
//      and 'Well Ventilated' is selected...
        if ventControl.selectedSegmentIndex == 0 {
            ventKey.isEnabled = false              // Left label disabled
            ventKey.text = "Ventilation"           // Left label is 'Ventilation'
            ventValue.isHidden = false             // Right label unhidden
            ventValue.text = "Well Ventilated"     // Right label text changed
        }
        
//      and 'Poorly Ventilated' is selected...
        else if ventControl.selectedSegmentIndex == 1 {
            ventKey.isEnabled = false              // Left label disabled
            ventKey.text = "Ventilation"           // Left label is 'Ventilation'
            ventValue.isHidden = false             // Right label unhidden
            ventValue.text = "Not Well Ventilated" // Right label text changed
        }
//      and 'Well Ventilated' and 'Car' is selected...
        if ventControl.selectedSegmentIndex == 0 || envControl.selectedSegmentIndex == 3 {
            ventKey.isEnabled = false              // Left label disabled
            ventKey.text = "Windows"               // Left label is 'Windows'
            ventValue.isHidden = false             // Right label unhidden
            ventValue.text = "Open"                // Right label text changed
        }
        
//      and 'Poorly Ventilated' and 'Car' is selected...
        else if ventControl.selectedSegmentIndex == 1 || envControl.selectedSegmentIndex == 3 {
            ventKey.isEnabled = false              // Left label disabled
            ventKey.text = "Windows"               // Left label is 'Windows'
            ventValue.isHidden = false             // Right label unhidden
            ventValue.text = "Closed"              // Right label text changed
        }
        
//      and nothing is selected...
        else {
            ventKey.isEnabled = true               // Left label enabled
            ventValue.isHidden = true              // Right label hidden
        }
    }
    
//  'Distancing' controls...
    @IBAction func distSelected(_ sender: Any) {
        
//      and 'Alone' is selected...
        if distControl.selectedSegmentIndex == 0 {
            distKey.isEnabled = false              // Left label disabled
            distValue.isHidden = false             // Right label unhidden
            distValue.text = "Alone"               // Right label text changed
        }
        
//      and 'Distanced' is selected...
        else if distControl.selectedSegmentIndex == 1 {
            distKey.isEnabled = false              // Left label disabled
            distValue.isHidden = false             // Right label unhidden
            distValue.text = "Distanced"           // Right label text changed
        }
        
//      and 'Crowded' is selected...
        else if distControl.selectedSegmentIndex == 2 {
            distKey.isEnabled = false              // Left label disabled
            distValue.isHidden = false             // Right label unhidden
            distValue.text = "Crowded"             // Right label text changed
        }
        
//      and nothing is selected...
        else {
            distKey.isEnabled = true               // Left label enabled
            distValue.isHidden = true              // Right label hidden
        }
    }
    
//  'Talking' controls...
    @IBAction func talkSelected(_ sender: Any) {
        
//      and 'Silent' is selected...
        if talkControl.selectedSegmentIndex == 0 {
            talkKey.isEnabled = false              // Left label disabled
            talkValue.isHidden = false             // Right label unhidden
            talkValue.text = "Silent"               // Right label text changed
        }
        
//      and 'Speaking' is selected...
        else if talkControl.selectedSegmentIndex == 1 {
            talkKey.isEnabled = false              // Left label disabled
            talkValue.isHidden = false             // Right label unhidden
            talkValue.text = "Speaking"               // Right label text changed
        }
        
//      and 'Shouting' is selected...
        else if talkControl.selectedSegmentIndex == 2 {
            talkKey.isEnabled = false              // Left label disabled
            talkValue.isHidden = false             // Right label unhidden
            talkValue.text = "Shouting"               // Right label text changed
        }
        
//      and nothing is selected...
        else {
            talkKey.isEnabled = true              // Left label enabled
            talkValue.isHidden = true             // Right label hidden
        }
    }
    
//  'Masking' controls...
    @IBAction func maskSelected(_ sender: Any) {
        
//      and 'Masking' is selected...
        if maskControl.selectedSegmentIndex == 0 {
            maskKey.isEnabled = false              // Left label disabled
            maskValue.isHidden = false             // Right label unhidden
            maskValue.text = "Masks Worn"          // Right label text changed
        }
        
//      and 'No Masking' is selected...
        else if maskControl.selectedSegmentIndex == 1 {
            maskKey.isEnabled = false              // Left label disabled
            maskValue.isHidden = false             // Right label unhidden
            maskValue.text = "Masks Not Worn"      // Right label text changed
        }
        
//      and nothing is selected...
        else {
            maskKey.isEnabled = true               // Left label enabled
            maskValue.isHidden = true              // Right label hidden
        }
    }
    
//  When user taps 'Reset' button...
    @IBAction func resetTapped(_ sender: Any) {
        self.count = 0                                                                  // resets the timer to 0
        self.timer.invalidate()                                                         // stops the timer from counting
        self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)    // makes the timer string say 0
        self.envControl.selectedSegmentIndex = -1
        self.ventControl.selectedSegmentIndex = -1
        self.distControl.selectedSegmentIndex = -1
        self.talkControl.selectedSegmentIndex = -1
        self.maskControl.selectedSegmentIndex = -1
        self.envKey.isEnabled = true
        self.ventKey.isEnabled = true
        self.distKey.isEnabled = true
        self.talkKey.isEnabled = true
        self.maskKey.isEnabled = true
        self.envValue.isHidden = true
        self.ventValue.isHidden = true
        self.distValue.isHidden = true
        self.talkValue.isHidden = true
        self.maskValue.isHidden = true
        self.topAreaColor.backgroundColor = UIColor.tertiarySystemFill
        self.timerLabel.backgroundColor = UIColor.systemFill
        self.headerLabel.text = "Look Up"
        self.subtextLabel.text = "Describe your surroundings below"

    }
    
//  When user has selected all controllers...
    @IBAction func startTapped(_ sender: Any) {
        if (envControl.selectedSegmentIndex >= 0 && ventControl.selectedSegmentIndex >= 0 && distControl.selectedSegmentIndex >= 0 && talkControl.selectedSegmentIndex >= 0 && maskControl.selectedSegmentIndex >= 0) || (envControl.selectedSegmentIndex == 0 && distControl.selectedSegmentIndex >= 0 && talkControl.selectedSegmentIndex >= 0 && maskControl.selectedSegmentIndex >= 0) {
            
            timerCounting = true                            // set timer counting to true
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,                  // fire the timer every 1 second
                target: self,                       // target of the selector message is self
                selector: #selector(timerCounter),  // message to send to self (below)
                userInfo: nil,                      // --
                repeats: true                       // repeatedly rescheduled timer until invalidated
            )              // get the timer to start counting...
        }
        else {
            timerCounting = false                                                      // set timer counting to be false
            timer.invalidate()                                                         // stop the timer
        }
    }
    
//  Combinations of controller selections
    @IBAction func controllerSelected(_ sender: Any) {
        
        let AL = envControl.selectedSegmentIndex == 0
        let LO = distControl.selectedSegmentIndex == 1
        let HO = distControl.selectedSegmentIndex == 2
        let OV = envControl.selectedSegmentIndex == 0 && ventControl.selectedSegmentIndex == -1
        let WV = envControl.selectedSegmentIndex >= 0 && ventControl.selectedSegmentIndex == 0
        let PV = envControl.selectedSegmentIndex >= 0 && ventControl.selectedSegmentIndex == 1
        let WM = maskControl.selectedSegmentIndex == 0
        let NM = maskControl.selectedSegmentIndex >= 1
        let SI = talkControl.selectedSegmentIndex >= 0
        let SP = talkControl.selectedSegmentIndex >= 1
        let SH = talkControl.selectedSegmentIndex >= 2
        
//      Safe
        if (AL && ((OV && ((WM && (SI || SP || SH)) || (NM && (SI || SP || SH)))) || (WV && ((WM && (SI || SP || SH)) || (NM && (SI || SP || SH)))) || (PV && ((WM && (SI || SP || SH)) || (NM && (SI || SP || SH)))))) || (LO && ((OV && ((WM && (SI || SP || SH)) || (NM && SI))) || (WV && WM && (SI || SP)))) || (HO && OV && WM && SI) {
            self.topAreaColor.backgroundColor = UIColor.green
            self.timerLabel.backgroundColor = UIColor.systemFill
            self.headerLabel.text = "Low Risk"
            self.subtextLabel.text = "Looks safe"
        }
    
//      Safe-Mid
        else if (LO && ((OV && NM && SI) || (WV && ((WM && SH) || (NM && SI))) || (PV && WM && (SI || SP)))) || (HO && ((OV && WM && SP) || (WV && WM && (SI || SP)))) {
            self.topAreaColor.backgroundColor = UIColor.green
            self.timerLabel.backgroundColor = UIColor.yellow
            self.headerLabel.text = "Low Risk"
            self.subtextLabel.text = "Mid risk in 10 minutes"
        }

//      Mid
        else if (LO && ((OV && NM && SH) || (WV && NM && SP))) || (HO && OV && ((WM && SH) || (NM && SI))) {
            self.topAreaColor.backgroundColor = UIColor.yellow
            self.timerLabel.backgroundColor = UIColor.systemFill
            self.headerLabel.text = "Mid Risk"
            self.subtextLabel.text = "Keep some distance"
        }
        
//      Mid-High
        else if ((LO && ((WV && WM && SH) || (PV && ((WM && SH) || (NM && (SI || SP)))))) || (HO && ((OV && NM && SP) || (WV && ((WM && SH) || (NM && SI))) || (PV && WM && (SI || SP))))) {
            self.topAreaColor.backgroundColor = UIColor.yellow
            self.timerLabel.backgroundColor = UIColor.red
            self.headerLabel.text = "Low Risk"
            self.subtextLabel.text = "Looks safe"
        }
        
//      High
        else if (LO && PV && NM && SH) || (HO && ((OV && NM && SH) || (WV && NM && (SP || SH)) || (PV && ((WM && SH) || (NM && (SI || SP || SH)))))) {
            self.topAreaColor.backgroundColor = UIColor.red
            self.timerLabel.backgroundColor = UIColor.systemFill
            self.headerLabel.text = "Low Risk"
            self.subtextLabel.text = "Looks safe"
            
        }
        
//      Null
        else {
            self.topAreaColor.backgroundColor = UIColor.tertiarySystemFill
            self.timerLabel.backgroundColor = UIColor.systemFill
            self.headerLabel.text = "Look Up"
            self.subtextLabel.text = "Describe your surroundings below"
        }
        
    }
    
//  Create a method for selector (above)...
    @objc func timerCounter() -> Void {
        
        count = count + 1                                       // add 1 to 'count' var every time this function is run
        let time = secondsToHoursMinutesSeconds(seconds: count) // create 'time' with hrs, min, sec (below) & pass it through 'count' (top)
        let timeString = makeTimeString(
            hours: time.0,          // pass hours paramter through first integer
            minutes: time.1,        // pass minutes parameter through second integer
            seconds: time.2         // pass seconds paramtater through third integer
        )                   // create 'timeString' from 'makeTimeString' with parameters passed through 3 integers (below)
        timerLabel.text = timeString                            // set 'timerLabel' text parameter to 'timeString' var (above)
        
    }
    
//  Split seconds in 'count' into hrs, min, and sec as 3 Integers...
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60)) // seconds to hrs, min, sec conversion
        
        }
    
//  Convert hrs, min, and sec (3 integers) into one hh:mm:ss string...
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        
        var timeString = ""         // var with blank time string to start
        
        // Create the time string
        timeString += String(
            format: "%02d",
            hours
        )  // hours string converstion
        timeString += " : "         // add first :
        timeString += String(
            format: "%02d",
            minutes
        )  // minutes string conversion
        timeString += " : "         // add second :
        timeString += String(
            format: "%02d",
            seconds
        )  // seconds string conversion
        
        return timeString
        
    }
    
}
