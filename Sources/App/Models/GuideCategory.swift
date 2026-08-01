import Foundation

enum GuideCategory: String, CaseIterable, Identifiable {
    case transport = "交通出行"
    case food = "飲食外賣"
    case housing = "住屋家居"
    case shopping = "購物慳錢"
    case banking = "銀行支付"
    case telecom = "通訊辦卡"
    case government = "政府服務"
    case health = "醫療健康"
    case jobs = "求職就業"
    case education = "教育學校"
    case living = "生活資訊"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .transport: return "tram.fill"
        case .food: return "fork.knife"
        case .housing: return "house.fill"
        case .shopping: return "cart.fill"
        case .banking: return "creditcard.fill"
        case .telecom: return "antenna.radiowaves.left.and.right"
        case .government: return "building.columns.fill"
        case .health: return "cross.case.fill"
        case .jobs: return "briefcase.fill"
        case .education: return "graduationcap.fill"
        case .living: return "newspaper.fill"
        }
    }
}
