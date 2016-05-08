//
//  Canción.swift
//  Reproductor de Música
//
//  Created by Arturo Rivas on 8/5/16.
//  Copyright © 2016 Arturo Rivas. All rights reserved.
//

import Foundation
import UIKit

struct Canción {
    
    let título: String
    let portada: UIImage
    let url: NSURL
    
    init(título: String, portada: String, url: String) {
        self.título = título
        self.portada = UIImage(named: portada)!
        let urlLarga = NSBundle.mainBundle().pathForResource(url, ofType: nil)
        self.url = NSURL(fileURLWithPath: urlLarga!)
    }
}
