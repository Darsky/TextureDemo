//
//  ViewController.swift
//  TextureDemo
//
//  Created by Darsky on 2018/10/29.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController,ASTableDataSource,ASTableDelegate {

    private var tableNode:ASTableNode?
    
    private let demoArray = ["TableNode","Layout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.tableNode == nil {
            self.tableNode = ASTableNode(style: UITableView.Style.plain)
            self.tableNode?.dataSource = self
            self.tableNode?.delegate = self
            self.tableNode?.frame = self.view.bounds
            self.view.addSubnode(self.tableNode!)
        }
    }
    
    // MARK: - ASTableDataSource and ASTableDelegate
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return demoArray.count
    }
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let screenWidth:CGFloat = UIScreen.main.bounds.size.width
        return ASSizeRange(min: CGSize(width: screenWidth, height: 60.0), max: CGSize(width: screenWidth, height: 80.0))
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let demoTitle = demoArray[indexPath.row]
        return {
            let cell:ASTextCellNode = ASTextCellNode()
            cell.text = demoTitle
            return cell
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let controller = TableNodeViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else if indexPath.row == 1 {
            let controller = LayoutDemoController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    


}

