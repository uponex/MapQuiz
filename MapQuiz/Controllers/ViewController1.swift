//
//  ViewController1.swift
//  MathAppTwo
//
//  Created by Kalin M on 11.02.18.
//  Copyright © 2018 UponeX. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Mapbox

class ViewController1: UIViewController, MGLMapViewDelegate{
    
    var mapView: MGLMapView!
    
    let allQuestions = QuestionBank1()
    var pickedAnswer: String = " "
    var questionNumber: Int = 0
    var score: Int = 0
    let questionCount: Int = 4
    var lat: Double = 42.707159
    var lon: Double = 23.314215
    
    
    let styleURL = URL(string: "mapbox://styles/uponex/cjf17uhwj6s6a2rpc93o0lawj")
    //"mapbox://styles/uponex/cjewr1mg22m7c2rmp2kog9ybl"
    //"mapbox://styles/uponex/cjf17uhwj6s6a2rpc93o0lawj"
    
    @IBOutlet weak var banerView: GADBannerView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var annotationContextView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let request = GADRequest()
//        request.testDevices = [kGADSimulatorID]
//        banerView.adUnitID = "ca-app-pub-4164200746848644/2669612132"
//        banerView.rootViewController = self
//        banerView.load(request)
        
        //annotationContextView = UIView(frame:CGRect(x:100, y:100, width:50, height:50))
        
        self.view.addSubview(annotationContextView)
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        mapViewContainer.addSubview(mapView)
        
        // Set the map’s center coordinate and zoom level.
        mapView.setCenter(CLLocationCoordinate2D(latitude: lat, longitude: lon), zoomLevel: 8, animated: false)
        
        nextQuestion()
    }

    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = allQuestions.list[questionNumber].answerTextTab1
        }
        else if sender.tag == 2 {
            pickedAnswer = allQuestions.list[questionNumber].answerTextTab2
        }
        else if sender.tag == 3 {
            pickedAnswer = allQuestions.list[questionNumber].answerTextTab3
        }
        else if sender.tag == 4 {
            pickedAnswer = allQuestions.list[questionNumber].answerTextTab4
        }
        
// mapView.setCenter(CLLocationCoordinate2D(latitude: lat, longitude: lon), zoomLevel: 8, animated: false)
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
    }
    @objc func didTapMap(sender: UITapGestureRecognizer){
        annotationContextView.alpha = 1
        
    }

    
    func addAnswerButton () {
        answerButton1.setTitle("\(allQuestions.list[questionNumber].answerTextTab1)", for: .normal)
        answerButton2.setTitle("\(allQuestions.list[questionNumber].answerTextTab2)", for: .normal)
        answerButton3.setTitle("\(allQuestions.list[questionNumber].answerTextTab3)", for: .normal)
        answerButton4.setTitle("\(allQuestions.list[questionNumber].answerTextTab4)", for: .normal)
    }
    
    func updateUI() {
        scoreLabel.text = "Резултат: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(questionCount)"
        
    }
    
    func nextQuestion() {
        if questionNumber <= (questionCount - 1) {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            lat = allQuestions.list[questionNumber].answerLatitude
            lon = allQuestions.list[questionNumber].answerLongitude
            
 mapView.setCenter(CLLocationCoordinate2D(latitude: lat, longitude: lon), zoomLevel: 8, animated: false)
            

            
            //anotation pin
            let hello = MGLPointAnnotation()
            hello.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            hello.title = "Кой е този град?"
           // hello.subtitle = "Welcome to my marker"
            
            // Add marker `hello` to the map.
            mapView.addAnnotation(hello)
            
//            mapViewContainer.willRemoveSubview(mapView)
//            var CLLocationCoordinate2D = (CLLocationCoordinate2D(latitude: lat, longitude: lon)

            
            updateUI()
            addAnswerButton ()
        }
        else {
            let alert = UIAlertController(title: "БРАВО!", message: "Вие решихте всички задачи. \nИмате \(score) верни отговора от \(questionCount).", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Започни отначало", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                
            })
 
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    //anotation call tap func
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func checkAnswer() {

        let answerCheck = allQuestions.list[questionNumber].correctTextAnswer
        if answerCheck == pickedAnswer {
            ProgressHUD.showSuccess("Правилно")
            score = score + 1
        }
        else {
            ProgressHUD.showError("Грешно")
        }
    }
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
        
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("viewDidDisappear")
//    }

}
    

