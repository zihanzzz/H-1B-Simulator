//
//  ViewController.swift
//  H-1B Simulator
//
//  Created by James Zhou on 2/20/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, DegreeSelectionViewDelegate {
    
    let greenColor = UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1)
    
    let grayColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1)
    
    let goldColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1)
    
    let textFont = "AmericanTypewriter-Bold"
    
    let regularSlider = UISlider()
    
    let advancedSlider = UISlider()
    
    let regularDegreeNumber = UILabel()
    
    let advancedDegreeNumber = UILabel()
    
    let numberView = UILabel()
    
    let ADVANCED_QUOTA = Float(20000)
    
    let REGULAR_QUOTA = Float(65000 - 5400 - 1400)
    
    let degreeSelectionView = DegreeSelectionView(frame: CGRectZero, isRegular: true)
    
    func setUpDegreeSelection() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = greenColor
        self.title = "H-1B Lottery"
        let titleDict: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: textFont, size: 21)!]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict
        self.view.backgroundColor = UIColor.whiteColor()
        
        setUpResultView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setUpResultView() {
        
        let resultView = UIView(frame: CGRect(x: 0, y: 64, width: 375, height: 180))
        resultView.backgroundColor = grayColor
        
        let resultWords = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        resultWords.text = "The chance you are going to be selected is about"
        resultWords.textColor = UIColor.whiteColor()
        resultWords.numberOfLines = 2
        resultWords.textAlignment = NSTextAlignment.Center
        resultWords.font = UIFont(name: textFont, size: 22)
        
        
        self.numberView.frame = CGRect(x: 0, y: 90, width: 375, height: 60)
        
        
        self.numberView.textColor = UIColor.whiteColor()
        self.numberView.textAlignment = NSTextAlignment.Center
        self.numberView.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 80)
        
        
        
        let degreeView = UIView(frame: CGRect(x: 0, y: 244, width: 375, height: 120))
        degreeView.backgroundColor = goldColor
        
        let degreeWords = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 50))
        degreeWords.text = "My degree is"
        degreeWords.textColor = UIColor.whiteColor()
        degreeWords.textAlignment = NSTextAlignment.Center
        degreeWords.font = UIFont(name: textFont, size: 22)
        
        
        self.degreeSelectionView.frame = CGRect(x: 0, y: 50, width: 375, height: 70)
        self.degreeSelectionView.delegate = self
        
        let regularDegreeSliderView = UIView(frame: CGRect(x: 0, y: 364, width: 375, height: 120))
        regularDegreeSliderView.backgroundColor = UIColor.orangeColor()
        
        let regularDegreeWords = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 30))
        regularDegreeWords.text = "# of Applicants with Regular Degree"
        regularDegreeWords.textColor = UIColor.whiteColor()
        
        regularDegreeWords.textAlignment = NSTextAlignment.Center
        regularDegreeWords.font = UIFont(name: textFont, size: 18)
        
        
        self.regularSlider.frame = CGRect(x: 40, y: 50, width: 295, height: 70)

        self.regularSlider.minimumValue = 50000
        self.regularSlider.maximumValue = 200000
        self.regularSlider.continuous = true
        self.regularSlider.tintColor = UIColor.whiteColor()
        self.regularSlider.value = 157500
        self.regularSlider.addTarget(self, action: "regularValueDidChange:", forControlEvents: .ValueChanged)
        
        self.regularDegreeNumber.frame = CGRect(x: 0, y: 30, width: 375, height: 20)
        self.regularDegreeNumber.text = formatFloatNumber(self.regularSlider.value)
        self.regularDegreeNumber.textColor = UIColor.whiteColor()
        self.regularDegreeNumber.textAlignment = NSTextAlignment.Center
        self.regularDegreeNumber.font = UIFont(name: textFont, size: 18)
        
        
        regularDegreeSliderView.addSubview(regularDegreeWords)
        regularDegreeSliderView.addSubview(self.regularSlider)
        regularDegreeSliderView.addSubview(self.regularDegreeNumber)
        
        
        let advancedDegreeSliderView = UIView(frame: CGRect(x: 0, y: 484, width: 375, height: 120))
        advancedDegreeSliderView.backgroundColor = UIColor.purpleColor()
        
        let advancedDegreeWords = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 30))
        advancedDegreeWords.text = "# of Applicants with Advanced Degree"
        advancedDegreeWords.textColor = UIColor.whiteColor()
        advancedDegreeWords.textAlignment = NSTextAlignment.Center
        advancedDegreeWords.font = UIFont(name: textFont, size: 18)
        
        self.advancedSlider.frame = CGRect(x: 40, y: 50, width: 295, height: 70)
        self.advancedSlider.minimumValue = 50000
        self.advancedSlider.maximumValue = 200000
        self.advancedSlider.continuous = true
        self.advancedSlider.tintColor = UIColor.whiteColor()
        self.advancedSlider.value = 121200
        self.advancedSlider.addTarget(self, action: "advancedValueDidChange:", forControlEvents: .ValueChanged)
        
        self.advancedDegreeNumber.frame = CGRect(x: 0, y: 30, width: 375, height: 20)
        self.advancedDegreeNumber.text = formatFloatNumber(self.advancedSlider.value)
        self.advancedDegreeNumber.textColor = UIColor.whiteColor()
        self.advancedDegreeNumber.textAlignment = NSTextAlignment.Center
        self.advancedDegreeNumber.font = UIFont(name: textFont, size: 18)
        
        advancedDegreeSliderView.addSubview(advancedDegreeWords)
        advancedDegreeSliderView.addSubview(self.advancedSlider)
        advancedDegreeSliderView.addSubview(self.advancedDegreeNumber)
        
        resultView.addSubview(resultWords)
        resultView.addSubview(self.numberView)
        
        degreeView.addSubview(degreeWords)
        degreeView.addSubview(self.degreeSelectionView)
        
        self.view.addSubview(resultView)
        self.view.addSubview(degreeView)
        self.view.addSubview(regularDegreeSliderView)
        self.view.addSubview(advancedDegreeSliderView)
        
        calculateAndUpdate()
        
    }
    
    func regularValueDidChange(sender: UISlider!) {
        self.regularDegreeNumber.text = formatFloatNumber(self.regularSlider.value)
        calculateAndUpdate()
    }
    
    func advancedValueDidChange(sender: UISlider!) {
        self.advancedDegreeNumber.text = formatFloatNumber(self.advancedSlider.value)
        calculateAndUpdate()
    }
    
    func formatFloatNumber(floatValue: Float) -> String {
        let roundedValue = roundTo100(floatValue)
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        return numberFormatter.stringFromNumber(NSNumber(integer: roundedValue))!
    }
    
    func roundTo100(floatValue: Float) -> Int {
        return 100 * Int(round(floatValue/100.0))
    }
    
    
    
    func calculateAndUpdate() {
        
        let regularPool = Float(roundTo100(self.regularSlider.value))
        let advancedPool = Float((roundTo100(self.advancedSlider.value)))
        
        let advancedFirstRoundChance = ADVANCED_QUOTA / advancedPool

        let advancedSecondRoundChance = REGULAR_QUOTA / (advancedPool - ADVANCED_QUOTA + regularPool)
        
        let advancedChance = advancedFirstRoundChance * 1 + (1 - advancedFirstRoundChance) * advancedSecondRoundChance
        
        let regularChance = advancedSecondRoundChance
        
        if (self.degreeSelectionView.isRegular) {
            
            self.numberView.text = formatToResultView(regularChance)
            
        } else {
         
            self.numberView.text = formatToResultView(advancedChance)
         
        }
    }
    
    func formatToResultView(floatValue: Float) -> String {
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.numberStyle = .PercentStyle
        return numberFormatter.stringFromNumber(NSNumber(float: floatValue))!
        
    }
    
    func degreeDidChange() {
        calculateAndUpdate()
    }
    
    
    
    
    
    
    

}

