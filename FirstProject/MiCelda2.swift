//
//  MiCelda2.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 5/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class MiCelda2: UICollectionViewCell, DataHolderDelegate {
    @IBOutlet var imgMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func mostrarImagen(uri:String){
    self.imgMain?.image = nil
    // if(imagenDescargada==nil){
    DataHolder.sharedInstance.getImagen(clave: uri, delegate: self)
    }
    func DHDDescargarImganes(imagen: UIImage) {
        self.imgMain?.image = imagen
    }

//
}
