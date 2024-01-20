public struct Edge {
    let leading: Spacing
    let top: Spacing
    let trailing: Spacing
    let bottom: Spacing
    
    static public func top(_ padding: Spacing) -> Edge {
        Edge(leading: .none, top: padding, trailing: .none, bottom: .none)
    }
    
    static public func leading(_ padding: Spacing) -> Edge {
        Edge(leading: padding, top: .none, trailing: .none, bottom: .none)
    }
    
    static public func trailing(_ padding: Spacing) -> Edge {
        Edge(leading: .none, top: .none, trailing: padding, bottom: .none)
    }
    
    static public func bottom(_ padding: Spacing) -> Edge {
        Edge(leading: .none, top: .none, trailing: .none, bottom: padding)
    }
    
    static public func vertical(_ padding: Spacing) -> Edge {
        Edge(leading: .none, top: padding, trailing: .none, bottom: padding)
    }
    
    static public func horizontal(_ padding: Spacing) -> Edge {
        Edge(leading: padding, top: .none, trailing: padding, bottom: .none)
    }
    
    static public func axis(v vertical: Spacing, h horizontal: Spacing) -> Edge {
        Edge(leading: horizontal, top: vertical, trailing: horizontal, bottom: vertical)
    }
    
    static public func equal(_ value: Spacing) -> Edge {
        Edge(leading: value, top: value, trailing: value, bottom: value)
    }
    
    static public let none = equal(.none)
}
