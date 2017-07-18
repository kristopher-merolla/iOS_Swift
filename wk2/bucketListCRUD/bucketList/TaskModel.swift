//
//  TaskModel.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/18/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import Foundation

class TaskModel {
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://localhost:8000/tasks")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
