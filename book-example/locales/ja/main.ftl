book-title = mdBook ドキュメンテーション
localized-chapter-title = 現地化された例
simple = シンプルなテキスト
reference = 文献を含むシンプルなテキスト: { -something }

parameter = { $param }を含むテキスト
parameter2 = テキスト one { $param1 } second { $param2 }

email = EMAIL("example@example.org")を含むテキスト

crabs =
    { $crabs ->
        [one] カニが一匹いる。
        *[other] カニが{ $crabs }匹いる。
    }

fallback = これはデフォルトするはず
