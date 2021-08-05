import SwiftUI

struct ContentView: View {
    
    var totalPerPerson: Double? {
        
        if numberOfPeople.isEmpty {
            return 0
        }
        
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentages", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    TextField("Number Of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Amount per person")) {
                    Text("$ \(totalPerPerson ?? 0, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount Total")) {
                    Text("$ \(totalAmount, specifier: "%.2f")")
                }
            }
            
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
