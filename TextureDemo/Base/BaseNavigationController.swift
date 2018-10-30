//
//  BaseNavigationController.swift
//  MyDubanSwift
//
//  Created by Darsky on 2018/10/10.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    private var _orientations = UIInterfaceOrientationMask.portrait
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return self.topViewController?.shouldAutorotate ?? false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
           return self._orientations
        }
        set {
           self._orientations = self.topViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.portrait
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
