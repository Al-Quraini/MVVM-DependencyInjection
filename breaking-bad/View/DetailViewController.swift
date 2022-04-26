//
//  DetailViewController.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let model : Character
    
    init(model : Character) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 3
        return stack
    }()
    
    private lazy var charImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray6
        image.image = UIImage(systemName: "info")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var name : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.text = "name: "
        
        return label
    }()
    
    private lazy var occupation : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.text = "occupation: "
        
        return label
    }()
    
    private lazy var status : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.text = "status: "
        
        return label
    }()
    
    private lazy var nickname : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.text = "nickname: "
        
        return label
    }()
    
    private lazy var seasonAppearance : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.text = "seasonAppearance: "
        
        return label
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    

}

//MARK: - Functions
extension DetailViewController {
    
    private func setup(){
        navigationItem.title = model.name
        
        charImage.cacheImage(from: model.img)
        name.text?.append(contentsOf: model.name)
        model.occupation.forEach { occ in
            occupation.text?.append(contentsOf: " \(occ),")
        }
        status.text?.append(model.status)
        nickname.text?.append(contentsOf: model.nickname) 
        
        model.appearance.forEach { season in
            seasonAppearance.text?.append(contentsOf: "\(season), ")
        }
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(occupation)
        stackView.addArrangedSubview(status)
        stackView.addArrangedSubview(nickname)
        stackView.addArrangedSubview(seasonAppearance)
        view.addSubview(charImage)
        view.addSubview(stackView)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            charImage.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier:2),
            charImage.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: charImage.trailingAnchor, multiplier: 2),
            charImage.heightAnchor.constraint(equalTo: charImage.widthAnchor, multiplier: 10/9),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: charImage.bottomAnchor, multiplier:2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 5)
        ])
    }
}
