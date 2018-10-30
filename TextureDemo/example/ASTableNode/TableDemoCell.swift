//
//  TableDemoCell.swift
//  TextureDemo
//
//  Created by Darsky on 2018/10/29.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TableDemoCell: ASCellNode {
    
    private let imageViewNode:ASNetworkImageNode
    
    init(imgUrl: String) {
        self.imageViewNode = ASNetworkImageNode()
        self.imageViewNode.clipsToBounds = true
        self.imageViewNode.placeholderFadeDuration = 0.15
        self.imageViewNode.contentMode = .scaleAspectFill
        self.imageViewNode.shouldRenderProgressImages = true
        super.init()
        self.imageViewNode.url = URL(string: imgUrl)
        self.addSubnode(self.imageViewNode)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.imageViewNode.style.preferredSize = CGSize(width: constrainedSize.min.width, height: constrainedSize.min.height)
        return ASAbsoluteLayoutSpec(sizing: ASAbsoluteLayoutSpecSizing.sizeToFit, children: [self.imageViewNode])
    }
}
