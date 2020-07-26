//
//  OperationThreads.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation

class OperationThreads: NSObject {
    
    private let queueAppendArray = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    var resultArray =  [String]()
    let group = DispatchGroup()
    
    lazy var mediumThread = BlockOperation {[weak self] in
        for i in 0 ... 10000 {
            self?.group.enter()
            self?.queueAppendArray.async(flags:.barrier) {
                self?.resultArray.append("Hilo A|Prioridad media|valor \(i)")
                self?.group.leave()
            }
        }
    }
    lazy var lowThread = BlockOperation {[weak self] in
        for i in 0 ... 10000 {
            self?.group.enter()
            self?.queueAppendArray.async(flags:.barrier) {
                self?.resultArray.append("Hilo A|Prioridad baja|valor \(i)")
                self?.group.leave()
            }
        }
    }
    lazy var highThread = BlockOperation {[weak self] in
        for i in 0 ... 10000 {
            self?.group.enter()
            self?.queueAppendArray.async(flags:.barrier) {
                self?.resultArray.append("Hilo A|Prioridad alta|valor \(i)")
                self?.group.leave()
            }
        }
    }
    
    let queue = OperationQueue()
    
    func start() -> [String]{
        mediumThread.queuePriority = .normal
        lowThread.queuePriority = .low
        highThread.queuePriority = .high
        highThread.addDependency(mediumThread)
        queue.addOperations([mediumThread,lowThread,highThread], waitUntilFinished: true)
        group.wait()
        
        return resultArray
    }
}
