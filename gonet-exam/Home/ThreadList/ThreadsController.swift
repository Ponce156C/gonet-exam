//
//  ThreadsController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class ThreadsController: UICollectionViewCell, ThreadsControllerProtocol {
    
    
    @IBOutlet weak var threadTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var mainController: UIViewController?
    var threadsArray = [String]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.hiddeActiviIndicator()
    }
    
    @IBAction func startThreads(_ sender: UIButton) {
        self.showActivityIndicator()
        self.threadsArray = []
        self.executeThreads()
    }
    
    @IBAction func cleanThreads(_ sender: UIButton) {
        self.threadsArray = []
        threadTableView.reloadData()
    }
    
    func hiddeActiviIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }
    
    func executeThreads() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.showActivityIndicator()
            let operating = OperationThreads().start()
            self.presentDataThreads(threadsArray: operating)
        }
    }
    
    func presentDataThreads(threadsArray: [String]) {
        self.threadsArray += threadsArray
        DispatchQueue.main.async {
            self.threadTableView.reloadData()
            self.hiddeActiviIndicator()
        }
    }
}

extension ThreadsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "threadCell") as! ThreadCell
        cell.ThreadTitle.text = threadsArray[indexPath.row]
        return cell
    }
}
