//
//  ViewController.swift
//  SimpleSwitcher
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import UIKit

final class MainViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var rootView: MainViewRootView!
    
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        createView()
        updateView()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        viewModel.success()
    }
    
    @IBAction func errorAction(_ sender: UIButton) {
        viewModel.error()
    }
    
    private func createView() {
        rootView = MainViewRootView()
        rootView.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
        rootView.center = view.center
        view.addSubview(rootView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.rootView.viewData = viewData
        }
    }
}

