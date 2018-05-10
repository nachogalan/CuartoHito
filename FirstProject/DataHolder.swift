//
//  DataHolder.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 10/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    var DHtxtUser:ViewController?
    var fireStoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    var firStorage:Storage?
    var arUsuarios:[Perfil] = []
    var firStorageRef:StorageReference?
    var sNickname:String = "QWERTY@gmail.com"
     var sPassword:String = "123456"
    var imagenDescarga:[String:UIImage]? = [:]
    
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
        
    }
    
    func getImagen(clave: String, delegate: DataHolderDelegate){
        if self.imagenDescarga![clave]==nil{
            let gsReference = self.firStorage?.reference(forURL: clave)
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    let imgDescargada = UIImage(data: data!)
                    // Data for "images/island.jpg" is returned
                    //let image = UIImage(data: data!)
                    self.imagenDescarga?[clave] = imgDescargada
                    delegate.DHDDescargarImganes!(imagen: imgDescargada!)
                }   }        }
        else {
            delegate.DHDDescargarImganes!(imagen: self.imagenDescarga![clave]!)
            
        }
    }
    func descargarPerfiles(delegate:DataHolderDelegate){
        
        fireStoreDB?.collection("Perfiles").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaPerfilesCompleta!(blFin: false)
            } else {
                self.arUsuarios=[]
                for document in querySnapshot!.documents {
                    
                    let nombre:Perfil = Perfil()
                    nombre.setMap(valores: document.data())
                    self.arUsuarios.append(nombre)
                    
                    print("\(document.documentID) => \(document.data())")
                    
                }
                print("------->>>>>> ",self.arUsuarios.count)
                delegate.DHDDescargaPerfilesCompleta!(blFin: true)
                //self.tbTablaChamp?.reloadData()
                //self.refreshUI()
                
                
                
            }
        }
        
    }
    
    func crearUsuario (user:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().createUser(withEmail: user, password: password) { (user, error) in
            if user != nil{
                print("Registrado")
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                delegate.DHDCrearUsuarioRegistro!(blFin: true)
                
            }else{
                print(error!)
            }
            print("Hola")
        }
    }
    
    
    func confirmarLogin(user:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: user, password: password) { (user, error) in
            if user != nil{
                let ruta =
                    DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!);
                ruta?.getDocument { (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDConfirmacionLogin!(blFin: true)
                        
                    } else {
                        print(error!)
                    }
                }
                //self.performSegue(withIdentifier: "transitionLogin", sender: self)
            }
            else{
                print("NO SE HA LOGEADO!")
                print(error!)
            }
            
        }
        
        
    }
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaPerfilesCompleta(blFin:Bool)
    @objc optional func DHDConfirmacionLogin(blFin:Bool)
    @objc optional func DHDCrearUsuarioRegistro(blFin:Bool)
    @objc optional func DHDDescargarImganes(imagen:UIImage)
}
