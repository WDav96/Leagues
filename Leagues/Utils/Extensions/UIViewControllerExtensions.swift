//
//  UIViewControllerExtensions.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

import Foundation
import UIKit

var vSpinner: [UIView] = []

extension UIViewController {
    
    func showSpinner(onView: UIView) {
        let spinnerView = UIView(frame: onView.bounds)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        activityIndicator.color = .black
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        vSpinner.append(spinnerView)
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner.popLast()?.removeFromSuperview()
        }
    }
    
}
