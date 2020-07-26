//
//  PresentedController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class PresentedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tableSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableSegmentedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableSegmentedCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
        tableSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func segmentedSectionDidChange(_ sender: UISegmentedControl) {
        switch tableSegmentedControl.selectedSegmentIndex {
            case 0:
                tableSegmentedCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
            case 1:
                tableSegmentedCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: true)
            default:
                break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videogamesView", for: indexPath)
            cell.backgroundColor = UIColor.red
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threadsView", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
}
