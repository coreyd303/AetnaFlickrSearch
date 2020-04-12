//
//  NetworkPath.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

enum NetworkPath: CustomStringConvertible {
    case auth
    case profile
    case purchases
    case updatePassword
    case logout
    case resetPassword
    case templateCollections
    case templateFeed(groupID: String)
    case animationService
    case animationSchema(animationID: String)
    case newProject
    case userProjects
    case exportProject(projectID: String)
    case projects(projectID: String)
    case linkProject

    var description: String {
        switch self {
        case .auth:
            return "/auth"
        case .profile:
            return "/me"
        case .purchases:
            return "/purchases"
        case .updatePassword:
            return "/me/password"
        case .logout:
            return "/auth/logout"
        case .resetPassword:
            return "/auth/reset"
        case .templateCollections:
            return "/collections/templates"
        case .templateFeed(let groupID):
            return "/feeds/groups/\(groupID)"
        case .animationService:
            return "/process/animation"
        case .animationSchema(let animationID):
            return "/\(animationID).json"
        case .newProject:
            return "/projects"
        case .userProjects:
            return "/feeds/mine"
        case .exportProject(let projectID):
            return "/projects/\(projectID)/export"
        case .projects(let projectID):
            return "/projects/\(projectID)"
        case .linkProject:
            return "/links"
        }
    }
}
