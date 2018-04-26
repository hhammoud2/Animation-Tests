//
//  MyCollectionViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/26/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!

    var items = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = CustomFlowLayout()
        setCollectionViewCellSize(collectionView: collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        textField.placeholder = "1"
        for _ in 0...3 { addItem() }
        // Do any additional setup after loading the view.
    }

    func addItem() {
        items.insert(UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0), at: 0)
//        items.append(UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0))
    }

    @IBAction func addTapped(_ sender: UIButton) {
        var numberToAdd: Int = 0
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = textField.text?.rangeOfCharacter(from: decimalCharacters)
        var indexPaths = [IndexPath]()

        if decimalRange != nil {
            print(textField.text as Any)
            numberToAdd = Int(textField.text!)!
        } else if textField.text != nil {
            numberToAdd = 1
        } else {
            numberToAdd = 1
        }

        if numberToAdd > 0 {
            for i in 1...numberToAdd {
                addItem()
                indexPaths.append(IndexPath(item: i - 1, section: 0))
            }
            collectionView.insertItems(at: indexPaths)
        }
    }

    @IBAction func deleteTapped(_ sender: UIButton) {
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = textField.text?.rangeOfCharacter(from: decimalCharacters)
        var indexToDelete = 0

        if decimalRange != nil {
            indexToDelete = Int(textField.text!)!
        } else if textField.text != nil {
            indexToDelete = 1
        } else {
            indexToDelete = 1
        }
        if indexToDelete < items.count {
            items.remove(at: indexToDelete)
            collectionView.deleteItems(at: [IndexPath(item: indexToDelete, section: 0)])
        }
    }

    func setCollectionViewCellSize(collectionView : UICollectionView) {

        let flowLayout = collectionView.collectionViewLayout as! CustomFlowLayout
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10

        let cellWidth = (UIScreen.main.bounds.width - 41) / 3 // set the cell width according to the padding.
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
    }
}

extension MyCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        cell.contentView.backgroundColor = items[indexPath.item]
        return cell
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
