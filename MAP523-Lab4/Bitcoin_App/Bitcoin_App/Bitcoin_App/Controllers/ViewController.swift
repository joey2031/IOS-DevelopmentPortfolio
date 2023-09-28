//
//  ViewController.swift
//  Bitcoin_App

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
  
    lazy var currencys = Currencys()
    
    lazy var myService : Service = {
        let service = Service()
        service.delegate = self

        return service
    }()
        
    
    var resultSet : String?{
        didSet{
           print("Items has been set.")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}



extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencys.currNames.count
    }
    // The number of items in the array needs to match the return value of the function above
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        return currencys.currNames[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // print(currencys.currNames[row].name)        
        myService.fetchBitcoinData(withSearchKey: currencys.currNames[row].name)
    }
}
    // Delegate method recieves the callback.
    extension ViewController : ServiceDelagate{
        func bitCoinDidFinish(withData: String){
            print("delegate method")
            resultSet = withData
            self.priceLabel.text = resultSet
        }
    }
    


