//
//  ViewController.swift
//  Mod3_CreativeApp_GuessingGameHehnC
//
//  Created by Tiger Coder on 10/1/20.
//  Copyright © 2020 clc.hehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var feedBack: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    let step : Float = 1
    var randNum = 0
    var numWins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        randNum = Int.random(in:1...100)
        
        while (randNum == 50){
            randNum = Int.random(in:1...100)
        }
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        valueLabel.textColor = UIColor.black
        valueLabel.text = "\(sliderOutlet.value)"
    }
    
    @IBAction func restartClick(_ sender: UIButton) {
        
        if (restartButton.currentTitle == "Restart?"){
            
            randNum = Int.random(in: 1...100)
        
            feedBack.textColor = UIColor.white
            valueLabel .textColor = UIColor.white
            
            restartButton.setTitle("Guess", for: .normal)
            sliderOutlet.isEnabled = true
            
            return
        }
        
        if (restartButton.currentTitle == "Guess"){
                  
                  if (Int(sliderOutlet.value) > randNum){
                      
                    feedBack.textColor = UIColor.red
                    feedBack.text = "Too High!"
                    feedBack.isHidden = false
                      
                  }
                  if (Int(sliderOutlet.value) < randNum){
                      
                    feedBack.textColor = UIColor.red
                    feedBack.text = "Too Low!"
                    feedBack.isHidden = false
                      
                  }
            if (Int(sliderOutlet.value) == randNum) {
                    numWins = resetGame(winCount: numWins)
                    winLabel.text = "Wins: \(numWins)"
                  }
        }
        
    }
    
    func resetGame(winCount : Int) -> Int {
        
        feedBack.textColor = UIColor.green
        feedBack.text = "NICE! YOU GOT IT!"
        
        restartButton.setTitle("Restart?", for: .normal)
        sliderOutlet.isEnabled = false
        
        let newWinNum = winCount + 1
        return newWinNum
    }
    
}

