//
//  UIImageView.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 07/04/2022.
//

import Foundation
import UIKit

class UIImageViewAsync: UIImageView {

    override init()
    {
        super.init(frame: CGRect())
    }

    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data))
        }.resume()
    }

    func downloadImage(url:String){
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.contentMode = UIViewContentMode.ScaleAspectFill
                self.image = UIImage(data: data!)
            }
        }
    }
}
