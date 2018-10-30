//
//  TableNodeViewController.swift
//  TextureDemo
//
//  Created by Darsky on 2018/10/29.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TableNodeViewController: ASViewController<ASDisplayNode> {

    var imagesArray = ["https://www.raywenderlich.com/downloads/Progressive_Images/Birds/blueHeadedParrot.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Birds/HarpyEagle.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Birds/LoveBird.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Birds/Macaw.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Birds/MergusDuck.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Mammals/Jaguar.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Mammals/MargayCat.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Mammals/monkey.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Mammals/northernTamandua.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Mammals/sloth.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Reptiles/Alligator.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Reptiles/BeardedDragon.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Reptiles/KomodoDragon.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Reptiles/SpectacledCaiman.jpg",
                       "https://www.raywenderlich.com/downloads/Progressive_Images/Reptiles/TRex.jpg"]
    let tableNode:ASTableNode = ASTableNode()
    
    init() {
        super.init(node: self.tableNode)
        self.tableNode.backgroundColor = UIColor.white
        self.tableNode.dataSource = self
        self.tableNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    func nextPageWithCompletion(_ block: @escaping (_ results: [String]) -> ()) {
        let moreImages = Array(self.imagesArray[0 ..< 5])
        DispatchQueue.main.async {
            block(moreImages)
        }
    }
    
    func insertNewRows(_ newImages: [String]) {
        var indexPaths = [IndexPath]()
        
        let newTotalNumberOfPhotos = self.imagesArray.count + newImages.count
        
        for row in self.imagesArray.count ..< newTotalNumberOfPhotos {
            let path = IndexPath(row: row, section: 0)
            indexPaths.append(path)
        }
        
        self.imagesArray.append(contentsOf: newImages)
        if let tableNode = node as? ASTableNode {
            tableNode.insertRows(at: indexPaths, with: .none)
        }
    }
    
    // MARK: - ASTableDataSource && ASTableDelegate
}

extension TableNodeViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let imgUrl = imagesArray[indexPath.row]
        
        return {
            let cell = TableDemoCell(imgUrl: imgUrl)
            return cell
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let min = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3.0 * 2.0)
        let max = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        return ASSizeRange(min: min, max: max)
    }
    
}

extension TableNodeViewController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {
        nextPageWithCompletion { (results) in
            self.insertNewRows(results)
            context.completeBatchFetching(true)
        }
    }
    
    func shouldBatchFetch(for tableNode: ASTableNode) -> Bool {
        return true
    }
}
