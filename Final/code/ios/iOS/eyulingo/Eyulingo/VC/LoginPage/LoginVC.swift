//
//  LoginVC.swift
//  Eyulingo
//
//  Created by 法好 on 2019/7/1.
//  Copyright © 2019 yuetsin. All rights reserved.
//

import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import UIKit
import VideoSplashKit

class LoginVC: VideoSplashViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

//        overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
        textChanged(userNameField)

        userNameField.delegate = self
        passwordField.delegate = self

        automaticallyAdjustsScrollViewInsets = false

        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "DynamicBg", ofType: "mp4")!)
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = false
        //        self.startTime = 12.0
        //        self.duration = 4.0
        alpha = 0.7
        backgroundColor = UIColor.black
        contentURL = url
        restartForeground = true
    }

    override func viewWillAppear(_ animated: Bool) {
        passwordField.text = ""
        UINavigationBar.appearance().tintColor = .systemBlue
    }

    func makeAlert(_ title: String, _ message: String, completion: @escaping () -> Void) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "嗯", style: .default, handler: { _ in
            completion()
        })
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }

    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordField.resignFirstResponder()
            loginButtonTapped(loginButton)
        }
        return true
    }

    @IBAction func textChanged(_ sender: UITextField) {
        if userNameField.text == "" && passwordField.text == "" {
            resetButton.isEnabled = false
        } else {
            resetButton.isEnabled = true
        }

        if userNameField.text == "" || passwordField.text == "" {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterSegue", sender: self)
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        userNameField.text = ""
        passwordField.text = ""
        textChanged(userNameField)
    }

    @IBAction func forgetPasswordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "forgetPasswordSegue", sender: self)
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        passwordField.resignFirstResponder()
        let postParams: Parameters = [
            "username": userNameField.text!,
            "password": passwordField.text!,
        ]

        let loadingAlert = UIAlertController(title: nil, message: "请稍等……", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        loadingAlert.view.addSubview(loadingIndicator)

        present(loadingAlert, animated: true, completion: {
            var errorStr = "general error"
            Alamofire.request(Eyulingo_UserUri.loginPostUri,
                              method: .post,
                              parameters: postParams)
                .responseSwiftyJSON(completionHandler: { responseJSON in
                    if responseJSON.error == nil {
                        let jsonResp = responseJSON.value
                        if jsonResp != nil {
                            if jsonResp!["status"].stringValue == "ok" {
                                loadingAlert.dismiss(animated: true, completion: {
//                                    let destinationStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                                    let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "AdminVC") as! UITabBarController
//                                    self.present(destinationViewController, animated: true, completion: nil)
                                    self.performSegue(withIdentifier: "normalUserSegue", sender: self)
                                })
                                return
                            } else {
                                errorStr = jsonResp!["status"].stringValue
                            }
                        } else {
                            errorStr = "bad response"
                        }
                    } else {
                        errorStr = "no response"
                    }

                    if errorStr == "account_locked" {
                        loadingAlert.dismiss(animated: true, completion: {
                            self.makeAlert("登录失败", "您的账户已被冻结。",
                                           completion: {})
                        })
                    } else {
                        loadingAlert.dismiss(animated: true, completion: {
                            self.makeAlert("登录失败", "服务器报告了一个 “\(errorStr)” 错误。",
                                           completion: {})
                        })
                    }
                })
        })
    }
}
