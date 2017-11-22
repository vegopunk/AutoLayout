//
//  ViewController.swift
//  AutoLayout
//
//  Created by Денис Попов on 22.11.2017.
//  Copyright © 2017 Денис Попов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let decriptionTextView : UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bearImageView)
        view.addSubview(decriptionTextView)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        
        decriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 120).isActive = true
        decriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        decriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        decriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

