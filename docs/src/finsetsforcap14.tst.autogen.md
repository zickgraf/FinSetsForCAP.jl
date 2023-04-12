
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> Length( S )
3

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> Length( T )
2

julia> P = DirectProduct( S, T )
<An object in FinSets>

julia> Length( P )
6

julia> Display( P )
[ [ 1, "a" ], [ 2, "a" ], [ 3, "a" ], [ 1, "b" ], [ 2, "b" ], [ 3, "b" ] ]

```
