//
//  MIFabButton.swift
//  ColorSnipe
//
//  Created by Mario on 10/09/16.
//  Copyright © 2016 Mario Iannotta. All rights reserved.
//

import UIKit

protocol MIFabButtonDelegate: class {
 
    func fabButtonDidTapped(_ fabButton: MIFabButton)
    
}

class MIFabButton: UIView {
    
    weak var delegate: MIFabButtonDelegate?
    
    @IBOutlet weak var button: UIButton!

    static func get(delegate: MIFabButtonDelegate?) -> MIFabButton {
        
        let fabButton = UINib(nibName: String(describing: self), bundle: Bundle(for: MIFabButton.self)).instantiate(withOwner: self, options: nil).last as! MIFabButton
        
        fabButton.delegate = delegate
        
        return fabButton
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.width/2
        
        
    }
    
    @IBAction func fabButtonDidTapped(_ sender: AnyObject?) {
        
        delegate?.fabButtonDidTapped(self)
        
    }

}
