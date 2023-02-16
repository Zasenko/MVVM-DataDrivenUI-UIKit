//
//  ViewData.swift
//  SimpleSwitcher
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import Foundation

enum ViewData {
    
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
