
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 5 )
|5|

julia> n = FinSet( 4 )
|4|

julia> f = MapOfFinSets( m, [ 1, 1, 0, 0, 2 ], n )
|5| → |4|

julia> g = MapOfFinSets( m, [ 4, 4, 3, 3, 4 ], m )
|5| → |5|

julia> IsColiftable( f, g )
true

julia> chi = Colift( f, g )
|4| → |5|

julia> Display( chi )
[ 0,..., 3 ] ⱶ[ 3, 4, 4, 0 ]→ [ 0,..., 4 ]

julia> PreCompose( f, Colift( f, g ) ) == g
true

julia> IsColiftable( g, f )
false

```
