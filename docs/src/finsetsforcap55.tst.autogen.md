
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( 7 )
|7|

julia> N = FinSet( 3 )
|3|

julia> iotaN = MapOfFinSets( N, [ 1, 2, 4 ], M )
|3| → |7|

julia> NC = PseudoComplementSubobject( iotaN )
|4|

julia> tauN = EmbeddingOfPseudoComplementSubobject( iotaN )
|4| ↪ |7|

julia> Display( tauN )
[ 0,..., 3 ] ⱶ[ 0, 3, 5, 6 ]→ [ 0,..., 6 ]

julia> L = FinSet( 4 )
|4|

julia> iotaL = MapOfFinSets( L, [ 1, 3, 4, 6 ], M )
|4| → |7|

julia> NIL = IntersectionSubobject( iotaN, iotaL )
|2|

julia> iotaNiL = EmbeddingOfIntersectionSubobject( iotaN, iotaL )
|2| ↪ |7|

julia> Display( iotaNiL )
[ 0, 1 ] ⱶ[ 1, 4 ]→ [ 0,..., 6 ]

julia> NUL = UnionSubobject( iotaN, iotaL )
|5|

julia> iotaNuL = EmbeddingOfUnionSubobject( iotaN, iotaL )
|5| → |7|

julia> Display( iotaNuL )
[ 0,..., 4 ] ⱶ[ 1, 2, 3, 4, 6 ]→ [ 0,..., 6 ]

julia> NPL = RelativePseudoComplementSubobject( iotaN, iotaL )
|6|

julia> iotaNpL = EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL )
|6| ↪ |7|

julia> Display( iotaNpL )
[ 0,..., 5 ] ⱶ[ 0, 1, 3, 4, 5, 6 ]→ [ 0,..., 6 ]

```
