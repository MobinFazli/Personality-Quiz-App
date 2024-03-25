//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Mobin Fazli on 2024-03-24.
//

import Foundation

// Quiz Questions Structure
struct Question {
    // Represent The Question Text
    var text: String
    
    // Represent The Type Of Response Expected For The Question
    var type: ResponseType
    
    // Represent The List Of Possible Answers For The Question
    var answers: [Answer]
}

// Quiz Question Respone Type Enum
enum ResponseType {
    // Enumerates The Types Of Responses A Question Can Have
    case single, multiple, ranged
}

// Quiz Answers Structure
struct Answer {
    // Represent The Answer Text
    var text: String
    
    // Represent The Personality Type Associated With The Answer
    var type: AnimalType
}

// Quiz Personality Type Enum
enum AnimalType: Character {
    // Enumerates The Types Of Character A Quiz Can Have
    case eagle = "🦅", wolf = "🐺", gorilla = "🦍", snake = "🐍"
    
    // Personality Type Definition Or Description Of That Specific Character
    var definition: String {
        switch self {
        // If Eagle
        case .eagle:
            return "You're A Visionary, Soaring High And Focused On Your Goals"
            
        // If Wolf
        case .wolf:
            return "You're A Loyal Team Player, Thriving In Camaraderie And Cooperation"
            
        // If Gorilla
        case .gorilla:
            return "You're A Powerful Force, Commanding Respect With Your Presence And Wisdom"
            
        // If Snake
        case .snake:
            return "You're A Strategic Thinker, Navigating Life's Challenges With Grace And Cunning"
        }
    }
}
