//
//  DetailStorm.swift
//  StormViewer
//
//  Created by Sarah dos Santos Silva on 27/02/23.
//

import UIKit

class DetailStorm: UIView {

    lazy var image: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundConfig()
        configSubViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubViews(){
        addSubview(self.image)
    }
    
    private func backgroundConfig(){
        self.backgroundColor = .white
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
           
            self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.image.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
