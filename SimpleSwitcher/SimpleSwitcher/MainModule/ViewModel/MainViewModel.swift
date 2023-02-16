//
//  MainViewModel.swift
//  SimpleSwitcher
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func success()
    func error()
}

final class MainViewModel: MainViewModelProtocol {

    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func success() {
        updateViewData?(.success(ViewData.Data(icon: "done",
                                               title: "Success",
                                               description: "Good",
                                               numberPhone: "12345")))
    }
    
    public func error() {
        updateViewData?(.failure(ViewData.Data(icon: "error",
                                               title: "failure",
                                               description: "Bad",
                                               numberPhone: "00000")))
    }
}
