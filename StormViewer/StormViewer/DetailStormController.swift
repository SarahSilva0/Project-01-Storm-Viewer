//
//  DetailStormController.swift
//  StormViewer
//
//  Created by Sarah dos Santos Silva on 27/02/23.
//

import UIKit

class DetailStormController: UIViewController {
    
    var detail: DetailStorm?
    var selectedImage: String?
    var selectedPictureNumber: Int = 0
    var totalPictures: Int = 0
    
    override func loadView() {
        self.detail = DetailStorm()
        self.view = self.detail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Imagem \(selectedPictureNumber) de \(totalPictures)" //navigation title
        navigationItem.largeTitleDisplayMode = .never // o titulo fica pequeno 
        loadImage()
        
    }

    private func loadImage(){
        if let imageToLoad = selectedImage{
            detail?.image.image = UIImage(named: imageToLoad)
        }
    }
    
}

