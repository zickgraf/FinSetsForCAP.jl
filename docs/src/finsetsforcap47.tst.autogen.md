
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( 5 )
|5|

julia> N1 = FinSet( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( N1, M )
|3| ↪ |5|

julia> Display( iota1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> N2 = FinSet( 2 )
|2|

julia> iota2 = EmbeddingOfFinSets( N2, M )
|2| ↪ |5|

julia> Display( iota2 )
[ 0, 1 ] ⱶ[ 0 .. 1 ]→ [ 0,..., 4 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|2|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|2| → |3|

julia> Display( pi1 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|2| → |2|

julia> Display( pi2 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

```
