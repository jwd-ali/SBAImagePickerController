//
//  ViewController.swift
//  SBAImagePickerController
//
//  Created by Shoaib Akhtar on 05/08/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        first.titleLabel?.isOpaque = true
//        first.titleLabel?.backgroundColor = .syste
//        
//        second.titleLabel?.isOpaque = true
//        second.titleLabel?.backgroundColor = .white
    }

    @IBAction func push(_ sender: Any) {
        let coordinator = SBAMultipleImagePickerController.init(rootViewCOntroler: self,maximumImages: 5) {[weak self] (images, cancel) in
            guard let _ = self else{return}
            print(images?.count ?? 0)
        }
        coordinator.translate {[weak self] (key) -> String in
            guard let _ = self else{return ""}
            return NSLocalizedString(key, comment: "")
        }
        coordinator.push()
    }
    
    @IBAction func present(_ sender: Any) {
        let coordinator = SBAMultipleImagePickerController.init(rootViewCOntroler: self,maximumImages: 50) {[weak self] (images, cancel) in
            guard let _ = self else{return}
            print(images?.count ?? 0)
        }
        coordinator.translate {[weak self]  (key) -> String in
            guard let _ = self else{return ""}
            return NSLocalizedString(key, comment: "")
        }
        coordinator.present()
    }
    
}


