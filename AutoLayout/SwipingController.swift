//
//  SwippingController.swift
//  AutoLayout
//
//  Created by Денис Попов on 25.11.2017.
//  Copyright © 2017 Денис Попов. All rights reserved.
//

import UIKit


extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", heagerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", heagerText: "Subscribe and get coupons on our daily events!", bodyText: "Get notified of the saving imediately when we anounce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", heagerText: "VIP members special services.", bodyText: "")
    ]
    
    private let previusButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevius), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevius(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        pc.numberOfPages = pages.count
        return pc
    }()
    
    //с помощью деления мы определяем какой индекс у pageControl для корректного отображения
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        print(x , view.frame.width, x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView?.backgroundColor = .white 
        
        collectionView?.isPagingEnabled = true
        
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previusButton,pageControl ,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
}
