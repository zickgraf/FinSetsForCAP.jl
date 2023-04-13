
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> P = Preimage( phi, [ 2 ] );

julia> Display( P )
[  ]

julia> P = Preimage( phi, AsList( FinSet( 5 ) ) );

julia> Display( P )
[ 1, 2 ]

```
