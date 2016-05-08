//
//  ViewController.swift
//  Reproductor de Música
//
//  Created by Arturo Rivas on 7/5/16.
//  Copyright © 2016 Arturo Rivas. All rights reserved.
//

import UIKit
import AVFoundation

let BOLD = UIFont.boldSystemFontOfSize(15)
let REGULAR = UIFont.systemFontOfSize(15)

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var controlVolumen: UIStepper!
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var título: UILabel!
    @IBOutlet weak var sliderVolumen: UISlider!
    
    @IBOutlet weak var botónDetener: UIButton!
    @IBOutlet weak var botónTocar: UIButton!
    @IBOutlet weak var botónPausar: UIButton!
    
    var reproductor: AVAudioPlayer!
    
    var canciones = [Canción]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        insertaCanciones()
        
        let random = Int(arc4random_uniform(5))
        cargarCanción(canciones[random])
        reproductor.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertaCanciones() {
        canciones.append(Canción(título: "137 horas", portada: "despistaos", url: "horas.m4a"))
        canciones.append(Canción(título: "Hey boy, hey girl", portada: "chermica", url: "hey.m4a"))
        canciones.append(Canción(título: "Mi coco", portada: "piratas", url: "micoco.m4a"))
        canciones.append(Canción(título: "Los coches chocones", portada: "desgraciaus", url: "chocones.m4a"))
        canciones.append(Canción(título: "El secreto de las tortugas", portada: "maldita", url: "tortugas.m4a"))
    }
    
    func cargarCanción(canción: Canción) {
        portada.image = canción.portada
        título.text = canción.título
        
        do {
            reproductor = try AVAudioPlayer(contentsOfURL: canción.url)
            
            controlVolumen.value = Double(reproductor.volume)
            sliderVolumen.value = reproductor.volume
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        botónTocar.titleLabel?.font = REGULAR
        botónPausar.titleLabel?.font = REGULAR
    }
    
    @IBAction func canciónAleatoria() {
        let random = Int(arc4random_uniform(5))
        if canciones[random].url != reproductor.url {
            cargarCanción(canciones[random])
            iniciarCanción()
        } else {
            canciónAleatoria()
        }
    }
    
    @IBAction func buscarCanción() {
        let alert = UIAlertController(title: "Seleccione canción", message: nil, preferredStyle: .ActionSheet)
        
        for canción in canciones {
            alert.addAction(UIAlertAction(title: canción.título, style: .Default, handler: { Void in
                self.cargarCanción(canción)
                self.iniciarCanción()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cerrar", style: .Destructive, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func deneterReproducción() {
        reproductor.stop()
        reproductor.currentTime = 0
    }

    @IBAction func iniciarCanción() {
        reproductor.play()
        botónTocar.titleLabel?.font = BOLD
    }
    
    @IBAction func pausarReproducción() {
        reproductor.pause()
    }
    
    @IBAction func cambioDeVolumen(sender: UIStepper) {
        reproductor.volume = Float(sender.value)
        sliderVolumen.value = reproductor.volume
    }
    
    @IBAction func cambioDeVolumenSlider(sender: UISlider) {
        reproductor.volume = sender.value
        controlVolumen.value = Double(reproductor.volume)
    }
    
    @IBAction func destacarBotónPulsado(sender: UIButton) {
        switch sender {
        case botónDetener:
            botónTocar.titleLabel?.font = REGULAR
            botónPausar.titleLabel?.font = REGULAR
            break
        case botónTocar:
            botónTocar.titleLabel?.font = BOLD
            botónPausar.titleLabel?.font = REGULAR
            break
        case botónPausar:
            botónTocar.titleLabel?.font = REGULAR
            botónPausar.titleLabel?.font = BOLD
            break
        default:
            break
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        botónTocar.titleLabel?.font = REGULAR
        botónPausar.titleLabel?.font = REGULAR
    }
    
}

