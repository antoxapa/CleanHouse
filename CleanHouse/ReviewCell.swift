//
//  ReviewCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 2/4/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var reviewText: UITextView! {
        didSet {
            reviewText.text = "Write review (as you wish)"
            reviewText.textColor = .lightGray
        }
    }
    var recall: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewText.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        self.recall = textView.text
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write review (as you wish)"
            textView.textColor = .lightGray
        }
    }
}
