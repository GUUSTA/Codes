//
//  HomeViewController.swift
//  PI5
//
//  Created by Gustavo Garcia Leite on 20/05/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnIniciar: UIButton!
    @IBOutlet weak var agua: UIImageView!
    @IBOutlet weak var imgNuvemPAzul: UIImageView!
    @IBOutlet weak var imgNuvemPCinza: UIImageView!
    @IBOutlet weak var imgNuvemGCinza: UIImageView!
    @IBOutlet weak var imgNuvemGAzul: UIImageView!
    var k: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animacoes()
        // Do any additional setup after loading the view.
        
        btnIniciar.layer.cornerRadius = 15
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func animacoes() {
        
        UIView.animate(withDuration: 2, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            
            
            self.imgNuvemPAzul.frame.origin.x += 20
            self.imgNuvemPCinza.frame.origin.x -= 20
            self.agua.frame.origin.y -= 20
//            self.btnIniciar.frame.size.width += 10
//            self.btnIniciar.frame.size.height += 10
//
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0.25, options: [.repeat, .autoreverse], animations: {
            
            self.imgNuvemGAzul.frame.origin.x += CGFloat(self.k)
            self.imgNuvemGCinza.frame.origin.x += CGFloat(self.k)
            
        }, completion:  nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
