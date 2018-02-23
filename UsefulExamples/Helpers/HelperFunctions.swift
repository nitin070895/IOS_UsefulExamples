import Foundation
import UIKit

public class HelperFunctions {

    var dialog:UIView!

    func showAlertMessage(message: String, root: UIView, context:ViewController) {
        
        dialog = UIView(frame: CGRect(x: (root.frame.width / 2) - 50, y: (root.frame.height / 2) - 50, width: 100, height: 100))
        dialog.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        var lblMessage:UILabel!
        lblMessage = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        //lblMessage.center = CGPoint(x: dialog.frame.midX, y: dialog.frame.midY)
        lblMessage.textColor = UIColor.white
        lblMessage.text = message
        
        dialog.addSubview(lblMessage)
        
        root.addSubview(dialog)
        
        print("Before the thread")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dismissDialog()
        }
        
        /*Timer.scheduledTimer(timeInterval: 2.0, target: context, selector: #selector(dismissDialog), userInfo: nil, repeats: false)*/
        
        print("End of the function")
    }
    
    @objc func dismissDialog(){
        dialog.removeFromSuperview()
        print("Dismissing dialog")
    }
}
