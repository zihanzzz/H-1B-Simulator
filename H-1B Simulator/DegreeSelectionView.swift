//
//  DegreeSelectionView.swift
//  H-1B Simulator
//
//  Created by James Zhou on 2/21/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

protocol DegreeSelectionViewDelegate {
    func degreeDidChange()
}

class DegreeSelectionView: UIView {
    
    var delegate: DegreeSelectionViewDelegate?
    
    let textFont = "AmericanTypewriter-Bold"
    
    var regularDegreeView: UIButton
    
    var advancedDegreeView: UIButton
    
    var regularCheck: UIImageView
    
    var advancedCheck: UIImageView
    
    var isRegular: Bool
    
    init(frame: CGRect, isRegular: Bool) {
        
        self.isRegular = isRegular
        
        self.regularDegreeView = UIButton(frame: CGRect(x: 0, y: 0, width: 375/2, height: 70))
        self.regularDegreeView.setTitle("          Regular", forState: .Normal)
        self.regularDegreeView.titleLabel?.font = UIFont(name: textFont, size: 22)
        self.regularDegreeView.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        
        self.regularCheck = UIImageView(frame: CGRect(x: 150, y: 20, width: 30, height: 30))
        self.regularCheck.image = UIImage(named: "tick_green")
        
        
        self.regularDegreeView.addSubview(self.regularCheck)
        
        self.advancedDegreeView = UIButton(frame: CGRect(x: 375/2, y: 0, width: 375/2, height: 70))
        self.advancedDegreeView.setTitle("     Advanced", forState: .Normal)
        self.advancedDegreeView.titleLabel?.font = UIFont(name: textFont, size: 22)
        self.advancedDegreeView.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        
        self.advancedCheck = UIImageView(frame: CGRect(x: 145, y: 20, width: 30, height: 30))
        self.advancedCheck.image = UIImage(named: "tick_green")
        
        self.advancedDegreeView.addSubview(self.advancedCheck)
        
        super.init(frame: frame)
        
        self.regularDegreeView.addTarget(self, action: "regularPressed", forControlEvents: .TouchDown)
        
        self.advancedDegreeView.addTarget(self, action: "advancedPressed", forControlEvents: .TouchDown)
        
        if (self.isRegular) {
            self.regularCheck.hidden = false
            self.advancedCheck.hidden = true
        } else {
            self.regularCheck.hidden = true
            self.advancedCheck.hidden = false
        }
        
        self.addSubview(self.regularDegreeView)
        self.addSubview(self.advancedDegreeView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func regularPressed() {
        self.regularCheck.hidden = false
        self.advancedCheck.hidden = true
        self.isRegular = true
        delegate?.degreeDidChange()
    }
    
    func advancedPressed() {
        self.regularCheck.hidden = true
        self.advancedCheck.hidden = false
        self.isRegular = false
        delegate?.degreeDidChange()
    }

}
