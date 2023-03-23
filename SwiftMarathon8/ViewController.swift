//
//  ViewController.swift
//  SwiftMarathon8
//
//  Created by Anton Charny on 23/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?
        .withTintColor(.systemGray, renderingMode: .alwaysOriginal))

    private lazy var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Avatar"
        
        self.scrollView.backgroundColor = .systemBackground
        self.scrollView.contentSize = .init(width: self.view.bounds.width, height: self.view.bounds.height * 2)
        self.view = self.scrollView
        
        self.addImage()
    }
    
    private func addImage() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            if let labelView = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(self.imageView)
                
                NSLayoutConstraint.activate([
                    self.imageView.heightAnchor.constraint(equalToConstant: 36),
                    self.imageView.widthAnchor.constraint(equalToConstant: 36),
                    self.imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    self.imageView.centerYAnchor.constraint(equalTo: labelView.centerYAnchor)
                ])
                return
            }
        }
    }
}

