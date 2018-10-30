//
//  LayoutDemoNode.swift
//  TextureDemo
//
//  Created by Darsky on 2018/10/30.
//  Copyright © 2018 Darsky. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LayoutDemoNode: ASDisplayNode {

    private let imageNode = ASNetworkImageNode()
    private let titleNode = ASTextNode()
    private let descriptionNode = ASTextNode()
    private let subTitleNode = ASTextNode()
    private let likeButton = ASButtonNode()
    
    
    override init() {
        super.init()
        //设置图片
        self.backgroundColor = UIColor.white
        self.imageNode.backgroundColor = UIColor.black
        self.imageNode.contentMode = .scaleAspectFit
        self.imageNode.clipsToBounds = true
        self.imageNode.url = URL(string: "https://www.raywenderlich.com/downloads/Progressive_Images/Birds/blueHeadedParrot.jpg")
        //设置名称
        let titleParagraph = NSMutableParagraphStyle()
        titleParagraph.alignment = NSTextAlignment.center
        self.titleNode.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.titleNode.attributedText = NSAttributedString(string: "Blue-headed Parrot", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),NSAttributedString.Key.paragraphStyle:titleParagraph])
        //设置描述
        self.descriptionNode.maximumNumberOfLines = 0
        self.descriptionNode.attributedText = NSAttributedString(string: "The blue-headed parrot, also known as the blue-headed pionus (Pionus menstruus) is a medium large parrot. It is about 27 cm long and they are mainly green with a blue head and neck, and red under tail feathers.[2] It is a resident bird in tropical and subtropical South America and southern Central America, from Costa Rica, Venezuela and Trinidad south to Bolivia and Brazil. It is named for its medium-blue head and neck.", attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
        //设置标签
        self.subTitleNode.attributedText = NSAttributedString(string: "parrot,pionus,South America.", attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 210/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)])
        
        //喜欢人数
        self.likeButton.borderColor = UIColor(red: 1/255.0, green: 198/255.0, blue: 30.0, alpha: 1.0).cgColor
        self.likeButton.borderWidth = 1.0
        self.likeButton.cornerRadius = 5.0
        self.likeButton.setAttributedTitle(NSAttributedString(string: "98", attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 190/255.0, green: 190/255.0, blue: 190/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)]), for: UIControl.State.normal)

        addSubnode(self.imageNode)
        addSubnode(self.titleNode)
        addSubnode(self.descriptionNode)
        addSubnode(self.likeButton)
        addSubnode(self.subTitleNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.imageNode.style.preferredSize = CGSize(width: constrainedSize.min.width, height: constrainedSize.min.height/3.0)
        self.titleNode.style.preferredSize = CGSize(width: constrainedSize.min.width, height: 30.0)
        let nameBox = ASInsetLayoutSpec(insets: UIEdgeInsets(top: CGFloat.infinity, left: 0.0, bottom: 0.0, right: 0.0), child: self.titleNode)
        let imageWithName = ASOverlayLayoutSpec(child: self.imageNode, overlay: nameBox)

        let contentSpec = ASStackLayoutSpec.vertical()
        contentSpec.spacing = 10.0
        contentSpec.style.flexShrink = 1.0;
        contentSpec.style.flexGrow = 1.0;
        contentSpec.children = [self.descriptionNode,self.subTitleNode]
        self.likeButton.style.preferredSize = CGSize(width: 60.0, height: 40.0)
        
        let detailBox = ASStackLayoutSpec.horizontal()
        detailBox.children = [contentSpec,self.likeButton]
        
        let detailSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0), child: detailBox)
        
        let contextSpec = ASStackLayoutSpec.vertical()
        contextSpec.justifyContent = ASStackLayoutJustifyContent.start
        contextSpec.children = [imageWithName,detailSpec]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 13.0, bottom: 10.0, right: 13.0), child: contextSpec)
    }

}
