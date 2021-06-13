//
//  ExploreController.swift
//  Twitter iOS Clone Project
//
//  Created by Ivan Ivanov on 6/12/21.
//

import UIKit

class ExploreController: UIViewController {
    // MARK: - Propetries
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Helpers
    func configureUI () {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
    }
}
