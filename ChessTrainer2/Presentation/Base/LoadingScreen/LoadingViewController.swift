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
    
    @IBOutlet weak var pawn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
