//
//  UIViewControllerExtension.swift
//  HarryPotterAPI
//
//  Created by Hin Wong on 3/11/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Has to be a LocalizedError so we can print the error.errorDescription (localizedDecription strips away custom descriptions).
    func presentErrorToUser(localizedError: LocalizedError) {
        
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
