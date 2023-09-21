//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Diego Carlino on 16/06/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var title: String
    var answers: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        title = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
