//
//  MIFabOptionCell.swift
//  ColorSnipe
//
//  Created by Mario on 10/09/16.
//  Copyright © 2016 Mario Iannotta. All rights reserved.
//

import UIKit

class MIFabOptionCell: UITableViewCell {
    
    static let cellIdentifier = "MIFabOptionCell"
    static var cellNib: UINib {
        return UINib(nibName: cellIdentifier, bundle: Bundle(for: MIFabOptionCell.self))
    }
    
    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconContainerViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelRightConstraint: NSLayoutConstraint!
    
    weak var bgColor: UIColor!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconContainerView.layer.cornerRadius = iconContainerView.frame.width/2
        
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            iconContainerView.backgroundColor = bgColor.withAlphaComponent(0.5)//UIColor.orange.withAlphaComponent(0.5)
        } else {
            iconContainerView.backgroundColor = bgColor//UIColor.orange
        }
        
    }
    
    func configure(fabOption: MIFabOption, config: MIFab.Config) {
        
        titleLabel.text = fabOption.title
        iconImageView.image = fabOption.image
        bgColor = fabOption.backgroundColor
        // iconImageView.backgroundColor = bgColor = fabOption.backgroundColor
        iconImageView.tintColor = fabOption.tintColor
        
        iconContainerViewWidth.constant = config.optionIconSize
        
        iconContainerView.layer.shadowColor = config.buttonShadowColor.cgColor
        iconContainerView.layer.shadowRadius = config.buttonShadowRadius
        iconContainerView.layer.shadowOpacity = 1
        iconContainerView.layer.shadowOffset = config.buttonShadowOffset
        
        titleContainerView.layer.shadowColor = config.optionLabelShadowColor.cgColor
        titleContainerView.layer.shadowRadius = config.optionLabelShadowRadius
        titleContainerView.layer.shadowOpacity = 1
        titleContainerView.layer.shadowOffset = config.optionLabelShadowOffset
        
        titleContainerView.layer.cornerRadius = 8
        
        titleLabelTopConstraint.constant = config.optionLabelPadding.height
        titleLabelBottomConstraint.constant = config.optionLabelPadding.height
        titleLabelLeftConstraint.constant = config.optionLabelPadding.width
        titleLabelRightConstraint.constant = config.optionLabelPadding.width
        
    }
    
}
