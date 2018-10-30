//
//  LayoutDemoController.swift
//  TextureDemo
//
//  Created by Darsky on 2018/10/30.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LayoutDemoController: ASViewController<ASDisplayNode> {

    init() {
        super.init(node: LayoutDemoNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
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
