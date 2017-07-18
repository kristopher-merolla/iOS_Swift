//
//  TaskModel.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/18/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import Foundation

class TaskModel {
    // create a function to get all tasks
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://localhost:8000/tasks")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    // create a function to add new tasks
    static func addTaskWithObjective(objective: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        // Create the url to request
        if let urlToReq = URL(string: "http://localhost:8000/tasks") {
            // Create an NSMutableURLRequest using the url. This Mutable Request will allow us to modify the headers.
            var request = URLRequest(url: urlToReq)
            // Set the method to POST
            request.httpMethod = "POST"
            // Create some bodyData and attach it to the HTTPBody
            let bodyData = "objective=\(objective)"
            request.httpBody = bodyData.data(using: .utf8)
            // Create the session
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            task.resume()
        }
    }
}
