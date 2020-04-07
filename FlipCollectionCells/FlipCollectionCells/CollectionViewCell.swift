//
//  CollectionViewCell.swift
//  FlipCollectionCells
//
//  Created by Kyle Wilson on 2020-04-05.
//  Copyright © 2020 Xcode Tips. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var flip = true
    var back: UIImageView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleLongTap(sender:)))
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        createViews()
    }
    
    
    @objc func handleLongTap(sender: UITapGestureRecognizer) {
        
        if flip {
            contentView.addSubview(back)
            UIView.transition(from: contentView, to: back, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, completion: nil)
            flip = false
        } else {
            UIView.transition(from: back, to: contentView, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, completion: nil)
            flip = true
        }
    }
    
    func createViews() {
        back = UIImageView(frame: self.frame)
        back.contentMode = .scaleAspectFit
    }
}
