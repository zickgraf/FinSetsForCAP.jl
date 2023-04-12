
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> K = FinSet( 3 )
|3|

julia> L = FinSet( 6 )
|6|

julia> l = MapOfFinSets( K, [ 2, 3, 4 ], L );; IsMonomorphism( l );; l
|3| ↪ |6|

julia> Display( l )
[ 0, 1, 2 ] ⱶ[ 2, 3, 4 ]→ [ 0,..., 5 ]

julia> G = FinSet( 8 )
|8|

julia> Display( G )
[ 0,..., 7 ]

julia> m = MapOfFinSets( L, [ 0, 1, 2, 3, 5, 6 ], G )
|6| → |8|

julia> Display( m )
[ 0,..., 5 ] ⱶ[ 0, 1, 2, 3, 5, 6 ]→ [ 0,..., 7 ]

```
