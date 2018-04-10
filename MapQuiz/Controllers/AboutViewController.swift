//
//  AboutViewController.swift
//  MathAppTwo
//
//  Created by Kalin M on 20.02.18.
//  Copyright © 2018 UponeX. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configuredMailController()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
        
    }
    func configuredMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["ios@uponex.com"])
        mailComposerVC.setSubject("Задачи по математика за 2-ри клас")
        
        return mailComposerVC
    }
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Не можете да изпратите имейл", message: "Вашето устройство не може да изпраща имейли. Моля проверете настройките на имейла и опитайте отново.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}
