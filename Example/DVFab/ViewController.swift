//
//  ViewController.swift
//  DVFab
//
//  Created by dien.vu@outlook.com on 12/02/2017.
//  Copyright (c) 2017 dien.vu@outlook.com. All rights reserved.
//

import UIKit

// Dien : MIFab (1)
import DVFab

class ViewController: UIViewController {

    // Dien : MIFab (2)
    fileprivate var fab: MIFab!
    @IBOutlet weak var btnCar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Dien : MIFab(3)
        setupFab()
    }

    // Dien : MIFab (4)
    fileprivate func setupFab() {
        var fabConfig = MIFab.Config() // Config for Fab & Sub-Item
        
        /*fabConfig.buttonPadding = CGSize(width: 10, height: 10)
        fabConfig.buttonSize = btnCar.frame.size.width
        fabConfig.buttonIconPadding = 0*/
        
        //fabConfig.buttonConstraints = ["H:[btnCar]-[fab(==btnCar)]", "V:[fab(==btnCar)]"]
        //fabConfig.buttonConstraintViews = ["btnCar": btnCar]
        fabConfig.buttonConstraints = ["V:[btnCar]-[fab(==btnCar)]": [], "H:[btnCar][fab(==btnCar)]": .alignAllCenterY]
        fabConfig.buttonConstraintViews = ["btnCar": btnCar]
        
        //fabConfig.buttonConstraintTo = btnCar
        
        fabConfig.buttonImage = UIImage(named: "sos_unactive")
        fabConfig.buttonBackgroundColor = UIColor.clear // only show icon .png, if orange the bounding will be circle, use with icon without circle
        
        fab = MIFab(
            parentVC: self,
            config: fabConfig,
            options: [
                MIFabOption(
                    title: "Kích Bình",
                    image: UIImage(named: "sos_kichbinh"),
                    backgroundColor: UIColor.clear, // only show icon.png (clear background)
                    tintColor: UIColor.white,
                    actionClosure: {
                        
                        let alertController = UIAlertController(title: "Demo", message: "First fab button tapped", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        
                        self.present(alertController, animated: true, completion: nil)
                }),
                MIFabOption(
                    title: "Cứu Hộ",
                    image: UIImage(named: "sos_cuuho"),
                    backgroundColor: UIColor.clear,
                    tintColor: UIColor.white,
                    actionClosure: {
                        
                        let alertController = UIAlertController(title: "Demo", message: "Second fab button tapped", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        
                        self.present(alertController, animated: true, completion: nil)
                }
                )
            ]
        )
        
        fab.showButton(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

