//
//  CharacterViewController.swift
//  HarryPotterAPI
//
//  Created by Hin Wong on 3/11/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    func updateViews() {
        CharacterController.shared.fetchCharacters { (result) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let characters):
                    let character = characters.randomElement()
                    self.nameLabel.text = character?.name
                    self.roleLabel.text = character?.role 
                    self.schoolLabel.text = character?.school
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    @IBAction func GenerateButtonTapped(_ sender: UIButton) {
                CharacterController.shared.fetchCharacters { (result) in
            
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let character):
                    self.updateViews()
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
