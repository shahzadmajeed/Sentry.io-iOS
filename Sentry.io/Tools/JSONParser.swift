//
//  ProjectDataProcessor.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 17/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

class JSONParser {
    static func parseProjects(data: Data) -> [Project]? {
        guard let project = try? JSONDecoder().decode([Project].self, from: data) else {
            print("Could not map JSON to projects")
            return nil
        }
        return project
    }
    
    static func parseIssues(data: Data) -> [Issue]? {
        do {
            let issue = try JSONDecoder().decode([Issue].self, from: data)
            return issue
        } catch let err {
            print("Error Decoding JSON: \(err)")
            return nil
        }
    }
}
