//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let example = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice1Destination: 1, choice2: "Take a right.", choice2Destination: 1),
        Story(title: "You fall", choice1: "You get up", choice1Destination: 2, choice2: "You sleep", choice2Destination: 2),
        Story(title: "You wake up", choice1: "You start to run", choice1Destination: 0, choice2: "You are dead", choice2Destination: 0)
    ]
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle!
        
        storyBrain.nextStory(userChoice)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
    
}

