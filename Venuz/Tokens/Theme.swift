final class Theme {
    private(set) static var shared = Theme(token: AphroditeToken())
    
    let token: Token
    
    private init(token: Token) {
        self.token = token
    }
}
