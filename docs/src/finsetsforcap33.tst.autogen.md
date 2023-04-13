
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 5 )
|5|

julia> p = FinSet( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 1, 4, 2 ], n )
|3| → |5|

julia> phi = MapOfFinSets( n, [ 0, 3, 5, 5, 2 ], p )
|5| → |7|

julia> alpha = PreCompose( psi, phi )
|3| → |7|

julia> Display( alpha )
[ 0, 1, 2 ] ⱶ[ 3, 2, 5 ]→ [ 0,..., 6 ]

```
