//
//  MetodosViewController.swift
//  PI5
//
//  Created by Gustavo Garcia Leite on 20/05/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

class MetodosViewController: UIViewController {

    @IBOutlet weak var btnProximo: UIButton!
    
    @IBOutlet weak var btnVoltar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnVoltar.layer.cornerRadius = 15
        btnProximo.layer.cornerRadius = 15
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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
