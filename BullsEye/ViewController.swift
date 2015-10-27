//
//  ViewController.swift
//  BullsEye
//
//  Created by Andre on 10/26/15.
//  Copyright © 2015 Andre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let MAX_POINT: Int = 100
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // start a new round
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        // set random target value
        targetValue = Int(arc4random_uniform(100))
        
        // set default currentValue to 50
        currentValue = 50
        slider.value = Float(currentValue)
        
        // increase round
        round += 1
        
        // update labels
        updateLabels();
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func calculatePoint(target:Int, value:Int) -> Int {
        return MAX_POINT - abs(target - value)
    }

    @IBAction func showAlert() {
        // calculate point & update score
        let point = calculatePoint(targetValue,value: currentValue)
        score += point
        
        // show message
        let message = "The value of the slider is: \(currentValue)"
                    + "\n The target value is: \(targetValue)"
                    + "\n You scored \(point) points"
                    + "\n Your total score is: \(score)"
                    + "\n Current round: \(round)"
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        // restart round
        startNewRound()
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func showInfo() {
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        // set current value
        currentValue = lroundf(slider.value)
    }
}

