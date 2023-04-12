
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> s = FinSet( 7 )
|7|

julia> t = FinSet( 4 )
|4|

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3, -2 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 1, 2, 1, 4, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 3, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
true

```
