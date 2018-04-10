//
//  HomeViewController.swift
//  MathAppTwo
//
//  Created by Kalin M on 11.02.18.
//  Copyright © 2018 UponeX. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareApp(_ sender: Any) {
        let shareAppPress = UIActivityViewController(activityItems: ["https://itunes.apple.com/gb/app/задачи-по-математика-за-1-клас/id1332292596?mt=8"], applicationActivities: nil)
        shareAppPress.popoverPresentationController?.sourceView = self.view
        self.present(shareAppPress, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
