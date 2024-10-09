
// create protocol
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmrgencyCallHandler {
    //type of delegate
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

//adapt lifesupport protocol
struct Paramedic:AdvancedLifeSupport {
    
    init (handler:EmrgencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print(" The paramedic does chest comperession ,30 per second.")
    }
}

class Doctor: AdvancedLifeSupport{
    init(handler: EmrgencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print(" The doctor does chest comperession ,30 per second.")
    }
    
    func useStatesscope() {
        print("Listening for heart sound")
    }
    
    
}

class Surgon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Stins staying alive by the BeeGees")
    }
    func useElectricDrill(){
        print(" Whirll ...")
    }
}

let emilio = EmrgencyCallHandler()
//let pete = Paramedic(handler: emilio)
let angela = Surgon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
    
