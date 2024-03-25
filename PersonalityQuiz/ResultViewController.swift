//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Mobin Fazli on 2024-03-23.
//

import UIKit

class ResultViewController: UIViewController {

    // Outlet
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    // Outlet
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    // Array To Store The User's Responses From The Quiz
    var responses: [Answer]
    
    // Class Initializer
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    // Class Initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide The Back Button In The Navigation Bar
        navigationItem.hidesBackButton = true
        
        // Calculate And Display The User's Personality Result
        calculatePersonalityResult()
    }
    
    // Calculate The User's Personality Result Based On Their Responses
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) {
            (counts, answer) in
            
            // Increment The Count Of The Current Personality Type If It Already Exists In The Dictionary
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            
            // Otherwise, Initialize It With A Count Of 1
            } else {
                counts[answer.type] = 1
            }
        }
        
        // Determine The Most Common Personality Type Based On User Responses
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        // Display The User's Personality Type
        resultAnswerLabel.text = "Congratulations! You're a \(mostCommonAnswer.rawValue)"
        
        // Display The Definition Corresponding To The User's Personality Type
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
