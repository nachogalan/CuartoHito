//
//  MiCelda1.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 5/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell, DataHolderDelegate {
    @IBOutlet var lblTabla:UILabel?
    @IBOutlet var lblEmail:UILabel?
    @IBOutlet var imgTabla:UIImageView?
    var imagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    func mostrarImagen(uri:String){
        self.imgTabla?.image = nil
        // if(imagenDescargada==nil){
        DataHolder.sharedInstance.getImagen(clave: uri, delegate: self)
    }
    
    func DHDDescargarImganes(imagen: UIImage) {
        self.imgTabla?.image = imagen
    }
}
//  }
