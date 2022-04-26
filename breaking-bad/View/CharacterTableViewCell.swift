//
//  CharacterTableViewCell.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let identifier : String = "CharacterTableViewCell"
    
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
        label.text = "this is the overview"
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.charImage.image = nil
        self.name.text = ""
    }
    
    
}


//MARK: - functions
extension CharacterTableViewCell {
    private func setup(){
        addSubview(charImage)
        addSubview(name)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            charImage.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            charImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: charImage.bottomAnchor, multiplier: 2),
            charImage.widthAnchor.constraint(equalTo: charImage.heightAnchor),
            
            name.leadingAnchor.constraint(equalToSystemSpacingAfter: charImage.trailingAnchor, multiplier: 2),
            name.topAnchor.constraint(equalTo: charImage.topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: name.trailingAnchor, multiplier: 2),
            name.bottomAnchor.constraint(equalTo: charImage.bottomAnchor)
        ])
    }
    
    func configureCell(model : Character) {
        self.charImage.cacheImage(from: model.img)
        self.name.text = model.name
    }
}
