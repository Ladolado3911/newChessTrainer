//
//  LaunchAnimationController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/28/21.
//

import UIKit

class LaunchAnimationController: BaseViewController {
    
    @IBOutlet weak var pawn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpLayout()
        
    }
    
    func setUpLayout() {
        setUpPawnAnimation()
    }
    
    func setUpPawnAnimation() {

        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: []) { [weak self] in
            guard let self = self else { return }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.pawn.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                self.pawn.transform = CGAffineTransform(rotationAngle: -2 * .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                self.pawn.transform = CGAffineTransform(rotationAngle: .pi * -0.2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                self.pawn.transform = CGAffineTransform(rotationAngle: -2 * .pi)
            }
            
        } completion: { bool in
        
        }
    }
}
