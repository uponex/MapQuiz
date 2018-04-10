//
//  Question.swift
//  MathAppTwo
//
//  Created by Kalin M on 11.02.18.
//  Copyright © 2018 UponeX. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let correctTextAnswer : String
    var answerTextTab1 : String
    var answerTextTab2 : String
    var answerTextTab3 : String
    var answerTextTab4 : String
    var answerLatitude : Double
    var answerLongitude : Double
    
    
    init(text: String, answerText1: String, answerText2: String, answerText3: String, answerText4: String, correctAnswer: String, latitudeDouble: Double, longitudeDouble: Double) {
        questionText = text
        correctTextAnswer = correctAnswer
        answerTextTab1 = answerText1
        answerTextTab2 = answerText2
        answerTextTab3 = answerText3
        answerTextTab4 = answerText4
        answerLatitude = latitudeDouble
        answerLongitude = longitudeDouble
    }
}

