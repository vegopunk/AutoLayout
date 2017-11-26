//
//  SwippingController.swift
//  AutoLayout
//
//  Created by Денис Попов on 25.11.2017.
//  Copyright © 2017 Денис Попов. All rights reserved.
//

import UIKit



class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", heagerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", heagerText: "Subscribe and get coupons on our daily events!", bodyText: "Get notified of the saving imediately when we anounce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", heagerText: "VIP members special services.", bodyText: "")
    ]
    
//    let imageNames = ["bear_first","heart_second","leaf_third"]
//    let headerStrings = ["Join use today in our fun and games!" , "Subscribe and get coupons on our daily events!" , "VIP members special services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView?.backgroundColor = .white 
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
//        cell.backgroundColor = indexPath.item % 2 ==  0 ? .red : .green
//        let imageName = pages[indexPath.item]
//        cell.bearImageView.image = UIImage(named: imageName)
//        cell.decriptionTextView.text = pages[indexPath.item]
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.bearImageView.image = UIImage(named: page.imageName)
//        cell.decriptionTextView.text = page.heagerText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
}
