//
//  Fab.swift
//  ColorSnipe
//
//  Created by Mario on 10/09/16.
//  Copyright © 2016 Mario Iannotta. All rights reserved.
//

import UIKit

class MIFabOptionsVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var overlayView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewRightConstraint: NSLayoutConstraint!
    
    weak var fabManager: MIFab!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Get Instance
    static func get(manager: MIFab) -> MIFabOptionsVC {
        
        let fabOptionVC = MIFabOptionsVC(nibName: "MIFabOptionsVC", bundle: Bundle(for: MIFabOptionsVC.self))
        
        fabOptionVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        fabOptionVC.fabManager = manager
        
        fabOptionVC.modalPresentationStyle = .overCurrentContext
        fabOptionVC.modalTransitionStyle = .coverVertical
        
        fabOptionVC.setupUI()
        fabOptionVC.setupTableView()
        
        fabOptionVC.view.layoutIfNeeded()
        
        print(manager.config)
        
        return fabOptionVC
        
    }
    
    // MARK: - Setup
    
    fileprivate func setupUI() {
        
        overlayView.backgroundColor = fabManager.config.overlayLayerColor
        
    }
    fileprivate func setupTableView() {
        // Option Table View
        tableView.register(MIFabOptionCell.cellNib, forCellReuseIdentifier: MIFabOptionCell.cellIdentifier)
        
        tableViewHeightConstraint.constant = fabManager.config.optionHeight * CGFloat(fabManager.fabOptions?.count ?? 0)
        tableViewWidthConstraint.constant = fabManager.config.width
        
        tableViewRightConstraint.constant = fabManager.config.buttonPadding.width + (fabManager.config.buttonSize - fabManager.config.optionIconSize)/2
        tableViewBottomConstraint.constant = fabManager.config.buttonPadding.height + fabManager.config.buttonSize + fabManager.config.spaceBetweenButtonAndOptions
        
        
        print(tableViewRightConstraint.constant)
        print(tableViewBottomConstraint.constant)
        
    }
    
    // MARK - IBActions
    
    @IBAction func closeOptionsTapped(sender: AnyObject?) {
        
        fabManager.hideFabOptions(animated: true)
        
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MIFabOptionsVC: UITableViewDataSource, UITableViewDelegate {
    
    // UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fabManager.fabOptions?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MIFabOptionCell.cellIdentifier, for: indexPath) as? MIFabOptionCell,
            let fabOption = fabManager.fabOptions?[indexPath.row]
            
        else { return UITableViewCell() }
        
        cell.configure(fabOption: fabOption, config: fabManager.config)
        
        return cell
        
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return fabManager.config.optionHeight
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fabManager.hideFabOptions(animated: true)
        fabManager.fabOptions?[indexPath.row].actionClosure?()
        
    }
    
}
