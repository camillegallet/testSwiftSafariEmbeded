import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {



    @IBOutlet weak var KronosWebsite: WKWebView!

    override func loadView() {
        KronosWebsite = WKWebView()
        self.view = KronosWebsite
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        openGoogle()
    }


    func openGoogle(){
        let url2=URL(string: "http://www.google.com")
        let web = SFSafariViewController(url: url2!)
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first


        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            do{
                topController.present(web, animated: true, completion: nil)


            }catch let error {
                DispatchQueue.main.async {
                    print("ERROR \(error)")
                }
            }
        }
    }
}
