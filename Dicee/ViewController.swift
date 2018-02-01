//
//  ViewController.swift
//  Dicee
//
//  Created by Pavan Sabnis on 1/27/18.
//  Copyright © 2018 Pavan Sabnis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Int values used for randomization
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    //stores dice imageViews on startup in case user wants to reset to default
    var tempImage1: UIImage!
    var tempImage2: UIImage!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //Counts the number of trials for the trial label
    @IBOutlet weak var trialCounterLabel: UILabel!
    
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // If I want to load up anything right when the app is opened, I do it in this method
        //In this app, I want the dice faces to be randomized right when the app is opened:
        
        randomizeDiceFace()
        trialCounterLabel.text = "1"
        
        tempImage1 = diceImageView1.image
        tempImage2 = diceImageView2.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        randomizeDiceFace()
        incrementTrialNumber()
        
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        diceImageView1.image = tempImage1
        diceImageView2.image = tempImage2
        
        trialCounterLabel.text = "1"
        
    }
    
    
    
    func randomizeDiceFace() {
        //choose random number for dice 1 and 2 face. casted into an Int from UInt32
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        //print to verify results
        //        print("randomDiceIndex1: \(randomDiceIndex1)")
        //        print("randomDiceindex2 \(randomDiceIndex2)")
        
        //change the dice image
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    func incrementTrialNumber() {
        var trialNum : Int = Int(trialCounterLabel.text!)!
        trialNum += 1
        trialCounterLabel.text = String(trialNum)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        randomizeDiceFace()
        incrementTrialNumber()
    }
    
}

