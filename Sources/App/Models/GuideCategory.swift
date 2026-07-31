import Foundation

enum GuideCategory: String, CaseIterable, Identifiable {
    case transport = "交通出行"
    case food = "飲食外賣"
    case housing = "住屋家居"
    case government = "政府服務"
    case banking = "銀行支付"
    case telecom = "通訊辦卡"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .transport: return "tram.fill"
        case .food: return "fork.knife"
        case .housing: return "house.fill"
        case .government: return "building.columns.fill"
        case .banking: return "creditcard.fill"
        case .telecom: return "antenna.radiowaves.left.and.right"
        }
    }
}
