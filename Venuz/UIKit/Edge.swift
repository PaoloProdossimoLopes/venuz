struct Edge {
    let leading: Spacing
    let top: Spacing
    let trailing: Spacing
    let bottom: Spacing
    
    static func vertical(_ padding: Spacing) -> Edge {
        Edge(leading: .none, top: padding, trailing: .none, bottom: padding)
    }
    
    static func horizontal(_ padding: Spacing) -> Edge {
        Edge(leading: padding, top: .none, trailing: padding, bottom: .none)
    }
    
    static func axis(v vertical: Spacing, h horizontal: Spacing) -> Edge {
        Edge(leading: horizontal, top: vertical, trailing: horizontal, bottom: vertical)
    }
    
    static let none = Edge(leading: .none, top: .none, trailing: .none, bottom: .none)
}
