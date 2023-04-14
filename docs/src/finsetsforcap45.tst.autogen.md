
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 5 )
|5|

julia> n1 = FinSet( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( n1, m )
|3| ↪ |5|

julia> Display( iota1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> n2 = FinSet( 4 )
|4|

julia> iota2 = EmbeddingOfFinSets( n2, m )
|4| ↪ |5|

julia> Display( iota2 )
[ 0,..., 3 ] ⱶ[ 0 .. 3 ]→ [ 0,..., 4 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|3|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|3| → |3|

julia> Display( pi1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> int1 = ImageObject( pi1 )
|3|

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|3| → |4|

julia> Display( pi2 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0,..., 3 ]

julia> int2 = ImageObject( pi2 )
|3|

julia> omega1 = PreCompose( pi1, iota1 )
|3| → |5|

julia> omega2 = PreCompose( pi2, iota2 )
|3| → |5|

julia> omega1 == omega2
true

julia> Display( omega1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0,..., 4 ]

```
