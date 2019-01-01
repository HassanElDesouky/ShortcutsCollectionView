//
//  ViewController.swift
//  ShortcutsCollectionView
//
//  Created by Hassan El Desouky on 12/13/18.
//  Copyright © 2018 Hassan El Desouky. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK : Properites
    let cellId = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCollectionView()
        setupNavigationBarController()
    }
    
    //MARK : Setup Methods
    fileprivate func setupNavigationBarController() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Lists"

        if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = true
        }

        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewList)), animated: true)
    }
    fileprivate func setupCollectionView() {
        collectionView?.backgroundColor = .white
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.alwaysBounceVertical = true
    }
    
    //MARK : CollectionView Delegate Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainCollectionViewCell
        cell.editButton.addTarget(self, action: #selector(editCellButton), for: .touchUpInside)
        
        cell.listNameLabel.text = "List"
        cell.iconImageView.image = UIImage(named: "Folder")
        
        cell.editButton.tag = indexPath.row
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 20, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    
    //MARK : - Actions
    @objc func addNewList() {
        print("Add new list")
    }
    @objc func editCellButton() {
        print("Edit")
    }

}

