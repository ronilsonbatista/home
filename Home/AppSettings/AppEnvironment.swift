//
//  AppEnvironment.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

enum AppEnvironment {
    case URL
    
    var value: String {
        switch self {
        case .URL: return "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
        }
    }
}
