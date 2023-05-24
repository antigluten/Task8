//
//  ViewController.swift
//  Task8
//
//  Created by va-gusev on 24.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(scrollView)
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height + 100)
        
        navigationController?.navigationBar.setupAvatarView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
}

extension UINavigationBar {
    func setupAvatarView() {
        DispatchQueue.main.async { [unowned self] in
            guard let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type,
                  let largeTitleView = self.subviews.first(where: {
                      $0.isKind(of: largeTitleClass)
                  }) else { return }
            
            
            let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            imageView.contentMode = .scaleAspectFill
            imageView.tintColor = .lightGray
            largeTitleView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 36),
                imageView.heightAnchor.constraint(equalToConstant: 36),
                imageView.trailingAnchor.constraint(equalTo: largeTitleView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -6)
            ])
        }
    }
}
