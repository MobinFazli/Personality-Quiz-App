//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mobin Fazli on 2024-03-23.
//

import UIKit

class QuestionViewController: UIViewController {

    // Outlet
    @IBOutlet weak var questionLabel: UILabel!
    
    // Single Stack View Outlets
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleBtn1: UIButton!
    
    @IBOutlet weak var singleBtn2: UIButton!
    
    @IBOutlet weak var singleBtn3: UIButton!
    
    @IBOutlet weak var singleBtn4: UIButton!
    
    // Multiple Stack View Outlets
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    
    @IBOutlet weak var multiLabel2: UILabel!
    
    @IBOutlet weak var multiLabel3: UILabel!
    
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    
    @IBOutlet weak var multiSwitch2: UISwitch!
    
    @IBOutlet weak var multiSwitch3: UISwitch!
    
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    // Range Stack View Outlets
    @IBOutlet weak var rangeStackView: UIStackView!
    
    @IBOutlet weak var rangeLabel1: UILabel!
    
    @IBOutlet weak var rangeLabel2: UILabel!
    
    @IBOutlet weak var rangeSlider: UISlider!
    
    // Outlet
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // Properties
    // Create Questions For The Quiz
    var questions: [Question] = [
        // Single Choice Questions - Q01
        Question (
            text: "Your Ideal Meal?",
            type: .single,
            answers: [
                Answer(text: "Sushi 🍣", type: .eagle),
                Answer(text: "Steak 🥩", type: .wolf),
                Answer(text: "Smoothie 🥤", type: .gorilla),
                Answer(text: "Salad 🥗", type: .snake)
            ]
        ),
           
        // Single Choice Questions - Q02
        Question (
            text: "Your Preferred Mode Of Travel?",
            type: .single,
            answers: [
                Answer(text: "Jet ✈️", type: .eagle),
                Answer(text: "Motorbike 🏍️", type: .wolf),
                Answer(text: "Off-road vehicle 🚜", type: .gorilla),
                Answer(text: "Submarine 🚤", type: .snake)
            ]
        ),
           
        // Single Choice Questions - Q03
        Question (
            text: "Favorite Season?",
            type: .single,
            answers: [
                Answer(text: "Spring 🌸", type: .eagle),
                Answer(text: "Summer ☀️", type: .wolf),
                Answer(text: "Autumn 🍂", type: .gorilla),
                Answer(text: "Winter ❄️", type: .snake)
            ]
        ),
           
        // Multiple Choice Questions - Q04
        Question (
            text: "Your Preferred Hobbies Are?",
            type: .multiple,
            answers: [
                Answer(text: "Reading 📚", type: .eagle),
                Answer(text: "Swimming 🏊", type: .wolf),
                Answer(text: "Gardening 🌱", type: .gorilla),
                Answer(text: "Gaming 🎮", type: .snake)
            ]
        ),
           
        // Multiple Choice Questions - Q05
        Question (
            text: "Your Favorite Colors Are?",
            type: .multiple,
            answers: [
                Answer(text: "Blue 🔵", type: .eagle),
                Answer(text: "Red 🔴", type: .wolf),
                Answer(text: "Green 🟢", type: .gorilla),
                Answer(text: "Yellow 🟡", type: .snake)
            ]
        ),
           
        // Multiple Choice Questions - Q06
        Question (
            text: "Your Preferred Fruits Are?",
            type: .multiple,
            answers: [
                Answer(text: "Apple 🍎", type: .eagle),
                Answer(text: "Orange 🍊", type: .wolf),
                Answer(text: "Watermelon 🍉", type: .gorilla),
                Answer(text: "Pineapple 🍍", type: .snake)
            ]
        ),
           
        // Ranged Questions - Q07
        Question (
            text: "How Do You Handle Stress?",
            type: .ranged,
            answers: [
                Answer(text: "Meditate 🧘", type: .eagle),
                Answer(text: "Hit The Gym 💪", type: .wolf),
                Answer(text: "Take A Nap 😴", type: .gorilla),
                Answer(text: "Go For A Walk 🚶", type: .snake)
            ]
        ),
           
        // Ranged Questions - Q08
        Question (
            text: "How Adventurous Are You?",
            type: .ranged,
            answers: [
                Answer(text: "Prefer Routine 🔄", type: .eagle),
                Answer(text: "Enjoy Some Risk 🎢", type: .wolf),
                Answer(text: "Crave Adventure 🌍", type: .gorilla),
                Answer(text: "Seek Adrenaline! 🚀", type: .snake)
            ]
        ),
           
        // Ranged Questions - Q09
        Question (
            text: "What's Your Approach To Learning?",
            type: .ranged,
            answers: [
                Answer(text: "Take My Time 🕰️", type: .eagle),
                Answer(text: "Learn By Doing 🛠️", type: .wolf),
                Answer(text: "Absorb Everything 🧠", type: .gorilla),
                Answer(text: "Learn On The Fly 🚀", type: .snake)
            ]
        ),
    ]
    
    // Track Which Questions Has Been Displayed In App
    var questionIndex = 0
      
    // Collection To Store Players Answers
    var answerChosen: [Answer] = []
    
    // View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Updating The Interface
        updateUI()
    }
    
    // Actions
    
    // Actions When Single Answer Button Pressed
    @IBAction func singleAnswerBtnPressed(_ sender: UIButton) {
        // Retrieve The Current Question's Answers
        let currentAnswers = questions[questionIndex].answers
        
        // Check Which Button Was Pressed And Append The Corresponding Answer To The Chosen Answers Array
        switch sender {
        // Answer 01
        case singleBtn1:
            answerChosen.append(currentAnswers[0])
          
        // Answer 02
        case singleBtn2:
            answerChosen.append(currentAnswers[1])
            
        // Answer 03
        case singleBtn3:
            answerChosen.append(currentAnswers[2])
            
        // Answer 04
        case singleBtn4:
            answerChosen.append(currentAnswers[3])
            
        // No Answer
        default:
            break
        }
        
        // Move To The Next Question
        nextQuestion()
    }
    
    // Actions When Multiple Answers Button Pressed
    @IBAction func multipleAnswerBtnPressed() {
        // Retrieve The Current Question's Answers
        let currentAnswers = questions[questionIndex].answers
        
        // Check Which Switches Are On And Append The Corresponding Answers To The Chosen Answers Array
        
        // Switche 01
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        
        // Switche 02
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        
        // Switche 03
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        
        // Switche 04
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        
        // Move To The Next Question
        nextQuestion()
    }
    
    // Actions When Ranged Answer Button Pressed
    @IBAction func rangeAnswerBtnPressed() {
        // Retrieve The Current Question's Answers
        let currentAnswers = questions[questionIndex].answers
        
        // Calculate The Index Based On The Slider Value
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        
        // Append The Corresponding Answer To The Chosen Answers Array
        answerChosen.append(currentAnswers[index])
        
        // Move To The Next Question
        nextQuestion()
    }
    
    // Action To Pass The Result To Segue
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultViewController? {
        // Pass The Chosen Answers To The Result View Controller
        return ResultViewController(coder: coder, responses: answerChosen)
    }
    
    // Updating The Interface
    func updateUI() {
        // Hide Single Stack View Initially
        singleStackView.isHidden = true
        
        // Hide Multiple Stack View Initially
        multipleStackView.isHidden = true

        // Hide Range Stack View Initially
        rangeStackView.isHidden = true
        
        // Retrieve The Current Question
        let currentQuestion = questions[questionIndex]
        
        // Retrieve The Answers For The Current Question
        let currentAnswer = currentQuestion.answers
        
        // Calculate The Total Progress Based On The Current Question Index
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Define The Custome Font
        let titleFont = UIFont(name: "Copperplate-Bold", size: 20.0)

        // Set The Navigation Bar Title Font And Color
        if let font = titleFont {
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        }
        
        // Set The Navigation Item Title To Indicate The Current Question Number
        navigationItem.title = "Question 0\(questionIndex + 1)"
        
        // Update The Question Label Text
        questionLabel.text = currentQuestion.text
        
        // Update The Progress View
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Update UI Based On The Type Of Question
        switch currentQuestion.type {
        // Single Answers Question
        case .single:
            updateSingleStack(using: currentAnswer)
            
        // Multiple Answers Question
        case .multiple:
            updateMultipleStack(using: currentAnswer)
            
        // Ranged Answers Question
        case .ranged:
            updateRangeStackView(using: currentAnswer)
        }
    }
    
    // Update The UI To Display Single Choice Question Options
    func updateSingleStack(using answers: [Answer]) {
        // Install The Stack View
        singleStackView.isHidden = false
        
        // Sets The Single Button Title For Each Answer
        singleBtn1.setTitle(answers[0].text, for: .normal)
        singleBtn2.setTitle(answers[1].text, for: .normal)
        singleBtn3.setTitle(answers[2].text, for: .normal)
        singleBtn4.setTitle(answers[3].text, for: .normal)
    }
    
    // Update The UI To Display Multiple Choice Question Options
    func updateMultipleStack(using answers: [Answer]) {
        // Install The Stack View
        multipleStackView.isHidden = false
        
        // Turn Off The Switches
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        // Sets The Multiple Label Answers Title
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    // Update The UI To Display Ranged Question Options
    func updateRangeStackView(using answers: [Answer]) {
        // Install The Stack View
        rangeStackView.isHidden = false
        
        // Set The Initial Value Of The Range Slider To The Midpoint (0.5) To Indicate A Neutral Position
        rangeSlider.setValue(0.5, animated: false)
        
        // Update The Text Of The First Range Label To Reflect The Text Of The First Answer
        rangeLabel1.text = answers.first?.text
        
        // Update The Text Of The Second Range Label To Reflect The Text Of The Last Answer
        rangeLabel2.text = answers.last?.text
    }
    
    // Move To The Next Question Or Show The Results If All Questions Have Been Answered
    func nextQuestion() {
        // Go To The Next Question
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Result", sender: nil) // Show The Results
        }
    }
}
