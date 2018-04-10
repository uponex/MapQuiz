import Foundation

class QuestionBank1 {
    var list = [Question]()
    
    init() {

        
        //1
        list.append(Question(text: "Кой е този град?", answerText1: "София", answerText2: "Пловдив", answerText3: "Перник", answerText4: "Русе", correctAnswer: "София", latitudeDouble: 42.707159, longitudeDouble: 23.314215))
        //2
        list.append(Question(text: "Кой е този град?", answerText1: "Варна", answerText2: "Бургас", answerText3: "Царево", answerText4: "Созопол", correctAnswer: "Бургас", latitudeDouble: 42.123477, longitudeDouble: 24.743618))
        //3
        list.append(Question(text: "Кой е този град?", answerText1: "София", answerText2: "Пловдив", answerText3: "Перник", answerText4: "Русе", correctAnswer: "София", latitudeDouble: 43.707159, longitudeDouble: 23.314215))
        //4
        list.append(Question(text: "Кой е този град?", answerText1: "Варна", answerText2: "Бургас", answerText3: "Царево", answerText4: "Созопол", correctAnswer: "Бургас", latitudeDouble: 42.123477, longitudeDouble: 25.743618))
      
    }
}

