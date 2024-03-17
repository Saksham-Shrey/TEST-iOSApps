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
    
    var StorySet: StoryBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyLabel.text = StorySet.stories[0].title
        choice1Button.setTitle(StorySet.stories[0].choice1, for: .normal)
        choice2Button.setTitle(StorySet.stories[0].choice2, for: .normal)

    }
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
        StorySet.nextStory(buttonTitle: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = StorySet.stories[StorySet.currentStory].title
        choice1Button.setTitle(StorySet.stories[StorySet.currentStory].choice1, for: .normal)
        choice2Button.setTitle(StorySet.stories[StorySet.currentStory].choice2, for: .normal)
    }
    

}

