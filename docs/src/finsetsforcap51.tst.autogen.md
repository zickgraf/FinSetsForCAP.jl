
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 4 )
|4|

julia> f = MapOfFinSets( m, [ 1, 1, 0 ], m )
|3| → |3|

julia> g = MapOfFinSets( n, [ 2, 1, 0, 1 ], m )
|4| → |3|

julia> IsLiftable( f, g )
true

julia> chi = Lift( f, g )
|3| → |4|

julia> Display( chi )
[ 0, 1, 2 ] ⱶ[ 1, 1, 2 ]→ [ 0,..., 3 ]

julia> PreCompose( Lift( f, g ), g ) == f
true

julia> IsLiftable( g, f )
false

julia> k = FinSet( 100000 )
|100000|

julia> h = ListWithIdenticalEntries( Length( k ) - 3, 2 );

julia> h = Concatenation( h, [ 1, 0, 1 ] );

julia> h = MapOfFinSets( k, h, m )
|100000| → |3|

julia> IsLiftable( f, h )
true

julia> IsLiftable( h, f )
false

```
