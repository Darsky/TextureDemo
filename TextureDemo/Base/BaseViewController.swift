//
//  BaseViewController.swift
//  MyDubanSwift
//
//  Created by Darsky on 2018/10/10.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
        // Do any additional setup after loading the view.
        self.setNavigationBarAttribute()
    }
    
    func setNavigationBarAttribute() -> () {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.setBackgroundImage(self.createImageWithColor(color: UIColor(red: 1.0/255.0, green: 168/255.0, blue: 254/255.0, alpha: 1.0)), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        if ((self.navigationController?.viewControllers.count)! > 1) {
            let backButton:UIButton = UIButton(type: UIButton.ButtonType.custom)
            backButton.backgroundColor = UIColor.clear
            backButton.setTitle("返回", for: UIControl.State.normal)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            backButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
            backButton.addTarget(self, action: #selector(backButtonPressed), for: UIControl.Event.touchUpInside)
            
            let backBarItem:UIBarButtonItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.setLeftBarButton(backBarItem, animated: false)
        }
        
    }
    
    func createImageWithColor(color: UIColor) -> UIImage {
        let rect:CGRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: 1.0, height: 1.0))
        UIGraphicsBeginImageContextWithOptions(rect.size, false,0.0)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    @objc func backButtonPressed() -> () {
        if (self.navigationController?.viewControllers.count)!>1 {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
