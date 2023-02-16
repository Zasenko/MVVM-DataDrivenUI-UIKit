//
//  MainViewRootView.swift
//  SimpleSwitcher
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import UIKit

final class MainViewRootView: UIView {
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activitiIndicator = makeActivityIndicatorView()
    lazy var titleLable = makeTitleLable()
    lazy var descriptionLable = makeDescriptionLable()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activitiIndicator.isHidden = true
            activitiIndicator.stopAnimating()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activitiIndicator.isHidden = false
            activitiIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activitiIndicator.isHidden = true
            activitiIndicator.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activitiIndicator.isHidden = true
            activitiIndicator.stopAnimating()
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        if let viewData = viewData {
            imageView.image = UIImage(named: viewData.icon ?? "heart")
            titleLable.text = viewData.title
            descriptionLable.text = viewData.description
        }
        titleLable.isHidden = isHidden
        descriptionLable.isHidden = isHidden
        imageView.isHidden = isHidden
    }
    
}

extension MainViewRootView {
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return imageView
    }
    
    private func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activitiIndicator = UIActivityIndicatorView(style: .large)
        activitiIndicator.color = .gray
        activitiIndicator.hidesWhenStopped = true
        addSubview(activitiIndicator)
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        activitiIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        activitiIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return activitiIndicator
    }
    
    private func makeTitleLable() -> UILabel {
        let titleLable = makeLable(size: 20)
        titleLable.font = .boldSystemFont(ofSize: 20)
        titleLable.numberOfLines = 0
        titleLable.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLable
    }
    
    private func makeDescriptionLable() -> UILabel {
        let descriptionLable = makeLable(size: 14)
        descriptionLable.numberOfLines = 0
        descriptionLable.topAnchor.constraint(equalToSystemSpacingBelow: titleLable.bottomAnchor, multiplier: 1).isActive = true
        descriptionLable.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return descriptionLable
    }
    
    private func makeLable(size: CGFloat) -> UILabel {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        lable.font = .systemFont(ofSize: size)
        addSubview(lable)
        return lable
    }
}
