//
//  LoadingViewController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/26/21.
//

import UIKit

class LoadingViewController: BaseViewController {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
        
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpLayout()
        
    }
    
    func setUpLayout() {
        let frame = CGRect(x: (screenWidth / 2) - 100, y: (screenHeight / 2) - 100, width: 200, height: 200)
        let testView = UIImageView()
        testView.frame = frame
        testView.image = UIImage(named: "object")
        
        view.addSubview(testView)
        
//        UIView.animate(withDuration: 1) {
//            testView.layer.backgroundColor = UIColor.blue.cgColor
//        }
        
//        UIView.animate(withDuration: 2, delay: 0.25, options: [.repeat, .autoreverse]) {
//            testView.transform = CGAffineTransform(rotationAngle: -6)
//        } completion: { bool in
//
//        }
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                testView.transform = CGAffineTransform(rotationAngle: -2 * .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                testView.transform = CGAffineTransform(rotationAngle: .pi * -0.2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                testView.transform = CGAffineTransform(rotationAngle: -2 * .pi)
            }
            
        } completion: { bool in
        
        }


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
