//
//  PresentedController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class PresentedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func segmentedSectionDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                segmentedCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
            case 1:
                segmentedCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: true)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videogamesView", for: indexPath) as! VideoGamesController
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threadsView", for: indexPath)
        return cell
    }
}
